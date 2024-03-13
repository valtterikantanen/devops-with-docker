FROM node:16-alpine as build-stage

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM node:16-alpine

WORKDIR /usr/src/app

RUN npm install -g serve && \
  adduser -D appuser

COPY --from=build-stage /usr/src/app/build ./build

USER appuser

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]