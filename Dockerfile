# Dockerfile для n8n с поддержкой Canvas на Railway

FROM n8nio/n8n:latest

# Переключаемся на root для установки зависимостей
USER root

# Устанавливаем системные зависимости для canvas
RUN apk add --no-cache \
    build-base \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    giflib-dev \
    pixman-dev \
    pangomm-dev \
    libjpeg-turbo-dev \
    freetype-dev

# Переключаемся на пользователя node
USER node

# Устанавливаем canvas через npm
RUN npm install -g canvas

# Возвращаемся к стандартной точке входа
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
