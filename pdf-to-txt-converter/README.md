# pdf-to-txt-converter/pdf-to-txt-converter/README.md

# PDF to Text Converter

This project provides a simple GUI tool to convert PDF files into text files while preserving as much formatting as possible. It utilizes the PyMuPDF library for reading PDF files.

## Features

- Extracts text from PDF files.
- Preserves basic formatting, including ASCII characters.
- Easy to use GUI interface.

## Requirements

- Python 3.6 or higher
- PyMuPDF
- PyInstaller

## Installation

1. Clone the repository:

   ```
   git clone https://github.com/yourusername/pdf-to-txt-converter.git
   ```

2. Navigate to the project directory:

   ```
   cd pdf-to-txt-converter
   ```

3. Install the required packages:

   ```
   pip install -r requirements.txt
   ```

## Creating the Executable

To create a standalone executable, run the following command:

```
bash create_executable.sh
```

The executable `PDF_to_Text_Converter` will be created in the project directory. You can run this executable directly from your desktop.

## Usage

To convert a PDF file to a text file using the GUI, run the executable and follow the prompts to select the PDF file and the output location for the text file.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.