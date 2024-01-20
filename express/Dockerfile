FROM node:16-alpine3.11

WORKDIR /

COPY package*.json ./

RUN npm install

COPY server.js .

EXPOSE 3000

CMD [ "node", "server.js" ]
