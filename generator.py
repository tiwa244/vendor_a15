#!/usr/bin/env python3
import os

# Path to proprietary-files.txt
prop_file_list = "proprietary-files.txt"
output_bp = "Android.bp"

# Map folder prefix to Soong sub_dir
folder_map = {
    "vendor": "vendor",
    "system_ext": "system_ext",
    "odm": "odm",
    "etc": "etc",
    "lib": "lib",
    "lib64": "lib64",
}

# Read proprietary files
with open(prop_file_list, "r") as f:
    files = [line.strip() for line in f if line.strip() and not line.startswith("#")]

modules = []

for file_path in files:
    # Determine module type based on folder
    if file_path.startswith("vendor/lib") or file_path.startswith("vendor/lib64"):
        module_type = "cc_prebuilt_library_shared"
        suffix = ".so"
    else:
        module_type = "prebuilt_etc"
        suffix = ""

    # Determine sub_dir
    sub_dir = None
    for key in folder_map:
        if file_path.startswith(key):
            sub_dir = folder_map[key]
            break
    if not sub_dir:
        sub_dir = "vendor"  # default

    # Generate a module name
    name = file_path.replace("/", "_").replace(".", "_").replace("-", "_")

    # --- THE PATH FIX IS HERE ---
    # We add 'proprietary/' so the BP in vendor/samsung/a15 sees the files inside
    module = f"""{module_type} {{
    name: "{name}",
    srcs: ["proprietary/{file_path}"],
    installable: true,"""
    
    if module_type == "prebuilt_etc":
        module += f'\n    sub_dir: "{sub_dir}",'
    elif module_type == "cc_prebuilt_library_shared":
        module += f'\n    suffix: "{suffix}",'

    module += "\n}\n"
    modules.append(module)

# Write Android.bp
with open(output_bp, "w") as f:
    f.write("// Generated Android.bp for proprietary files\n")
    f.write("soong_namespace {\n}\n\n")
    for m in modules:
        f.write(m)

print(f"Android.bp generated with {len(modules)} modules with proprietary/ prefix.")⬇
