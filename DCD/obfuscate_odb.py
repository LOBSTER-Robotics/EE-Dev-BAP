#!/usr/bin/python3
import os
from pathlib import Path
import zipfile
import tempfile
import argparse
import shutil

parser = argparse.ArgumentParser(prog="obfuscate_odb",
                                 description='Removes BOM information and obfuscates net names in ODB++ zip files from KiCAD',)
parser.add_argument("-I", "--input", help="Input zip that will be obfuscated", type=str)
args = parser.parse_args()

# Extract zip file into directory that can be worked with
path_to_zip_file        = Path(args.input).absolute()
directory_to_extract_to = path_to_zip_file.parents[0] / path_to_zip_file.stem
directory_to_extract_to.mkdir(parents=True, exist_ok=True)

print(f"Extracting {path_to_zip_file.__str__():s} to {directory_to_extract_to.__str__():s}")
with zipfile.ZipFile(path_to_zip_file, 'r') as zip_ref:
    zip_ref.extractall(directory_to_extract_to)

# Remove BOM information by deleting component-related folders
for root, subdirs, files in os.walk(directory_to_extract_to):
    if 'comp' in root:
        for f in files:
            file_path = Path(root) / Path(f)
            print(f"Deleting {file_path.__str__():s}")
            os.remove(file_path)
        os.rmdir(Path(root))

# Obfuscate net names
netlist_file = None
for root, subdirs, files in os.walk(directory_to_extract_to):
    for f in files:
        if "netlist" in f:
            if netlist_file is None:
                netlist_file = Path(root) / Path(f)
            else:
                raise Exception("Multiple netlist files found, this script was written for a different file structure")

obfuscation_association_file = path_to_zip_file.parents[0] / (path_to_zip_file.stem + "-obfuscations.txt")

print(f"Obfuscating netnames in {netlist_file.__str__():s}")
netlist_dir = netlist_file.parents[0]
with open(netlist_file, 'r') as infile, \
        tempfile.NamedTemporaryFile('w', dir=netlist_dir, delete=False) as tmpfile, \
        open(obfuscation_association_file, 'w') as association_file:
    tmp_path = tmpfile.name
    
    for line in infile:
        # break at # to prevent accidental processing past net definition section
        if line.startswith('#'):
            tmpfile.write(line)
            break

        if line.startswith('$0'):
            tmpfile.write(line)
        elif line.startswith('$'):
            n = line[1:].split()[0]
            tmpfile.write(f'${n} Net-{n}\n')
            association_file.write(f"Net-{n}\t {line[1:].split()[1]:s}\n")
        else:
            tmpfile.write(line)

    for line in infile:
        tmpfile.write(line)

os.replace(tmp_path, netlist_file)

print("Zipping back in ODB++ format...", end='')

with zipfile.ZipFile(path_to_zip_file, 'w', zipfile.ZIP_DEFLATED) as zf:
    for path in directory_to_extract_to.rglob('*'):
        if path.is_dir() and not any(path.iterdir()):
            zip_info = zipfile.ZipInfo(str(path.relative_to(directory_to_extract_to)) + '/')
            zf.writestr(zip_info, '')
        elif path.is_file():
            zf.write(path, path.relative_to(directory_to_extract_to))
shutil.rmtree(directory_to_extract_to)
Path(path_to_zip_file).rename(path_to_zip_file.parents[0] / Path(path_to_zip_file.stem + "-obfuscated.zip"))

print("Success!")
