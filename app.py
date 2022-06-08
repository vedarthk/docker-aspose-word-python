#!/usr/local/bin/python
import glob

if __name__ == "__main__":
    import aspose.words as aw
    lic = aw.License()
    lic.set_license("/lic/Aspose.Words.Python.NET.lic")

    filepaths = glob.glob("/docs/*.docx") + glob.glob("/docs/*.doc")

    saveOptions = aw.saving.PdfSaveOptions()
    saveOptions.export_document_structure = True
    saveOptions.custom_properties_export = aw.saving.PdfCustomPropertiesExport.STANDARD
    saveOptions.embed_full_fonts = True
    saveOptions.use_core_fonts = True
    saveOptions.font_embedding_mode = aw.saving.PdfFontEmbeddingMode.EMBED_ALL
    
    for filepath in filepaths:
        print(f"Converting {filepath}")
        doc = aw.Document(filepath)
        doc.save(f"{filepath}.pdf", saveOptions)
        print(f"Converting {filepath} [DONE]")

