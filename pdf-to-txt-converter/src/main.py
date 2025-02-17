import fitz
import os
from tkinter import Tk, filedialog, Button, StringVar

def pdf_to_text(pdf_path, txt_path):
    # Open the PDF file
    document = fitz.open(pdf_path)
    
    # Create or overwrite the text file
    with open(txt_path, 'w', encoding='utf-8') as text_file:
        # Iterate through each page in the PDF
        for page_num in range(len(document)):
            page = document[page_num]
            text = page.get_text("text")  # Extract text with formatting
            text_file.write(text)
            text_file.write("\n")  # Add a newline after each page

    document.close()

if __name__ == "__main__":
    def select_pdf_file():
        file_path = filedialog.askopenfilename(filetypes=[("PDF files", "*.pdf")])
        if file_path:
            pdf_file_path.set(file_path)

    def select_output_file():
        file_path = filedialog.asksaveasfilename(defaultextension=".txt", filetypes=[("Text files", "*.txt")])
        if file_path:
            output_text_path.set(file_path)

    def convert_pdf_to_text():
        pdf_to_text(pdf_file_path.get(), output_text_path.get())

    # Initialize the GUI application
    root = Tk()
    root.title("PDF to Text Converter")

    pdf_file_path = StringVar()
    output_text_path = StringVar()

    Button(root, text="Select PDF File", command=select_pdf_file).pack(pady=10)
    Button(root, text="Select Output File", command=select_output_file).pack(pady=10)
    Button(root, text="Convert", command=convert_pdf_to_text).pack(pady=20)

    root.mainloop()