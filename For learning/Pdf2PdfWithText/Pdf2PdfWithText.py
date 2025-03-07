import fitz
import pytesseract
from PIL import Image
import os
from pdf2image import convert_from_path
from PIL import Image
from pdfminer.high_level import extract_text
from fpdf import FPDF

# Укажите путь к исполняемому файлу Tesseract, если он не добавлен в PATH
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files (x86)\Tesseract-OCR\\tesseract.exe'
os.environ['TESSDATA_PREFIX'] = r'C:\Program Files (x86)\Tesseract-OCR\\'

os.chdir('For learning/Pdf2PdfWithText')
# print(os.getcwd())
# print(os.listdir())
def pdf_to_text_pdf(input_pdf_path, output_pdf_path):
    document = fitz.open(input_pdf_path)
    output_document = fitz.open()  # Создаем новый PDF для сохранения результата

    for page_num in range(len(document)):
        page = document.load_page(page_num)
        pix = page.get_pixmap()  # Получаем изображение страницы
        img = Image.frombytes("RGB", [pix.width, pix.height], pix.samples)

        try:
            '''Нужно исправить вот эту ошибку. Убери try и она появится. '''
        # Используем pytesseract для распознавания текста на русском и английском языках
            text = pytesseract.image_to_string(img, lang='rus+eng')

            # Создаем новую страницу в выходном документе
            new_page = output_document.new_page(width=page.rect.width, height=page.rect.height)
            new_page.insert_text((50, 50), text, fontsize=12)
        except pytesseract.pytesseract.TesseractError:
            continue


# Пример использования
input_pdf = 'Book about Unix.pdf'  # Укажите путь к вашему входному PDF файлу
output_pdf = 'output.pdf'  # Укажите путь для сохранения выходного PDF файла
pdf_to_text_pdf(input_pdf, output_pdf)
