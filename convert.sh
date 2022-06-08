#!/bin/bash
echo "Building docker image..."
docker build -t aspose-word-python:latest .
echo "Building docker image [DONE]"
echo "Converting documents..."
docker run -v "${PWD}/Aspose.Words.Python.NET.lic:/lic/Aspose.Words.Python.NET.lic" -v "${PWD}/docs/:/docs/" aspose-word-python:latest app.py
echo "Converting documents [DONE]"

