# pdf-to-txt-converter/pdf-to-txt-converter/README.md

# PDF to Text Converter

This project provides a simple command-line tool to convert PDF files into text files while preserving as much formatting as possible. It utilizes the PyMuPDF library for reading PDF files.

## Features

- Extracts text from PDF files.
- Preserves basic formatting, including ASCII characters.
- Easy to use command-line interface.

## Requirements

- Python 3.6 or higher
- PyMuPDF

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

## Usage

To convert a PDF file to a text file, run the following command:

```
python src/main.py path/to/your/file.pdf output.txt
```

Replace `path/to/your/file.pdf` with the path to your PDF file and `output.txt` with the desired output text file name.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.