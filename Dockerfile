# Dockerfile для n8n с поддержкой Canvas на Railway
# ВАЖНО: Сохраните этот файл как "Dockerfile" (без расширения .txt)

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

# Устанавливаем canvas глобально (доступен для всех node приложений)
RUN npm install -g canvas

# Переключаемся обратно на пользователя node
USER node

# Возвращаемся к стандартной точке входа
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
