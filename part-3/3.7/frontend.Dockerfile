FROM node:16-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build && \
  rm -rf node_modules && \
  npm install -g serve && \
  adduser -D appuser

USER appuser

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]