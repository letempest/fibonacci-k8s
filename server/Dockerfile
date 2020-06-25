FROM node:alpine
WORKDIR /app
COPY ./package*.json ./
RUN npm install
# COPY . .
COPY ["index.js", "keys.js", "/app/"]
CMD ["npm","run", "start"]