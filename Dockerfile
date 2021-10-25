FROM node:14

# execute all commands in this directory
WORKDIR /app

# copy package.json to the working directory of docker
COPY package.json .

# COPY . /src
# copy all of our current project to /src of the working directory, /app, in docker container

RUN npm install

# copy rest of the code to the working directory
COPY . .

# listen to port 3000
EXPOSE 3000

# command that is executed when a container is created based on an image
# RUN node app.mjs will not work since that would start the image itself
# What we require is to start the container created by the image
CMD ["node", "app.mjs"]


# The reason why we copy package.json first before copying the rest of our code
# is cuz docker follows a layer based architecture, where each command in the file is a layer
# And whenever we docker docker build it checks if the files we copy are changed and if so, the rest
# of the layers are also built from scratch, however if there wasn't any change it'll use its previous cache
# and hence will be so much faster.
# We do not want our docker image doing npm install whenever we change our regular source code,
# cuz that is unnecessary time wasted, we'll only ever need to do npm install if we change the package.json
# Therefore, copying over the package.json separately n doing npm install before copying the rest of the code
# will make sure that docker doesn't do npm install whenever the rest of the source code changes
# since the layer of copy package.json will use the cache of the previous build