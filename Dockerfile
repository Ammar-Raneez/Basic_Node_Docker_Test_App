FROM node:14

WORKDIR /app

# copy package.json to the working directory
COPY package.json .

RUN npm install

# copy rest of the code to the working directory
COPY . .

# listen to port 3000
EXPOSE 3000

CMD ["node", "app.mjs"]