import fitz  # type: ignore
from tkinter import Tk, filedialog, Button, StringVar
from utils import extract_text_from_pdf, save_text_to_file

def pdf_to_text(pdf_path, txt_path):
    text = extract_text_from_pdf(pdf_path)
    save_text_to_file(text, txt_path)

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