FROM node:20-alpine

# Install multimedia tools using the correct Alpine package names
RUN apk add --no-cache \
    ffmpeg \
    imagemagick \
    libwebp-tools

WORKDIR /app

COPY package*.json ./

# Explicitly install express for health checks, then download remaining packages
RUN npm install express --save && npm install --quiet --no-audit --no-fund --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
