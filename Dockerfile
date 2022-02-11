#Rust as the base image
FROM rust:latest
# create a new empty shell project
RUN USER=root cargo new --bin comfy 
WORKDIR /backend

# copy over your manifests
COPY ./backend .

# this build step will cache your dependencies
RUN cargo install --path .

# set the startup command to run your binary
CMD ["comfy"]

#React Instructions
FROM node:latest

WORKDIR /frontend

COPY ./frontend . 

RUN npm install

CMD ["npm", "start"]