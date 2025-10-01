# Dockerfile для n8n с Python и Pillow

FROM n8nio/n8n:latest

USER root

# Устанавливаем Python и зависимости для изображений
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-pillow \
    freetype \
    jpeg \
    zlib

# Создаем симлинк для python
RUN ln -sf python3 /usr/bin/python

# Устанавливаем Pillow через pip (если нужна последняя версия)
RUN pip3 install --break-system-packages Pillow

USER node

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
