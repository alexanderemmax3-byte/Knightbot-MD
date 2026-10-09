FROM node:16-bullseye

# Install system dependencies required for Puppeteer / Web scraping
RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    webp \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

# Run a clean install bypassing lockfile strictness
RUN npm install --quiet --no-audit --no-fund --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
