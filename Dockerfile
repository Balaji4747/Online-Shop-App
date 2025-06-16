# Getting base image for nodeJS

FROM node:18

# making a work directory for putting a code and required files

WORKDIR /app

# Copy everything from source [Host] to the Destination [container]

COPY . .

# install packages

RUN npm install

# expose the application 

EXPOSE 5173

# serve the application 

CMD ["npm", "run", "dev"]
