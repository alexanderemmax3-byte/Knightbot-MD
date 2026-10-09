FROM node:20-alpine

# Install multimedia tools using Alpine's fast package manager
RUN apk add --no-cache \
    ffmpeg \
    imagemagick \
    webp

WORKDIR /app

COPY package*.json ./

# Install packages bypassing dependency strictness
RUN npm install --quiet --no-audit --no-fund --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
