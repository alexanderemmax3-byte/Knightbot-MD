FROM nikolaik/python-nodejs:python3.10-nodejs16-bullseye

WORKDIR /app

COPY package*.json ./

RUN npm install --quiet --no-audit --no-fund --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
