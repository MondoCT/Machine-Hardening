def extract_text_from_pdf(pdf_path):
    import fitz # type: ignore

    # Open the PDF file
    document = fitz.open(pdf_path)
    text = ""

    # Iterate through each page
    for page_num in range(len(document)):
        page = document.load_page(page_num)
        text += page.get_text("text")  # Extract text while preserving formatting

    document.close()
    return text


def save_text_to_file(text, output_path):
    with open(output_path, 'w', encoding='utf-8') as text_file:
        text_file.write(text)