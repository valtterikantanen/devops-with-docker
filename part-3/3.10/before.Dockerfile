FROM node:20

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./

RUN npm ci --include=dev

COPY . .

RUN npm run build

CMD [ "node", "dist/index.js" ]