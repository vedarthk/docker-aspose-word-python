FROM python:3.9-bullseye
RUN sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y \
        ttf-mscorefonts-installer \
        libgdiplus \
        libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .

RUN pip install -r requirements.txt
COPY app.py /usr/bin/app.py
RUN chmod +x /usr/bin/app.py
ENV PYTHONUNBUFFERED 1
CMD ["/usr/bin/app.py"]

