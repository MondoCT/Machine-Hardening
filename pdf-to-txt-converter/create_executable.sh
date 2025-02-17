#!/bin/bash

# Install PyInstaller if not already installed
pip install pyinstaller

# Create the standalone executable
pyinstaller --onefile --windowed src/main.py

# Move the executable to the desired location
mv dist/main ./PDF_to_Text_Converter

# Clean up build files
rm -rf build dist main.spec
