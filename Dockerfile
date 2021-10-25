FROM node:14

WORKDIR /app

# copy package.json to the working directory of docker
COPY package.json .

# COPY . /app
# copy all of our current project to /app of the docker container

RUN npm install

# copy rest of the code to the working directory
COPY . .

# listen to port 3000
EXPOSE 3000

CMD ["node", "app.mjs"]