FROM node:24-alpine
RUN addgroup app && adduser -S -G app app
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
USER app
EXPOSE 3000
CMD ["node", "app.js"]