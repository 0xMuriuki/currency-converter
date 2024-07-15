# Base image which our application will run
FROM node:18-alpine

# Working directory of the docker container
WORKDIR /app

# Copy the package.json from local system to the docker image
COPY package.json .

# Install dependencies
RUN npm install 

# Install serve dependency to serve the static file
RUN npm i -g serve

# Copy the rest files into the docker image
COPY . .

# Create a production build
RUN npm run build

# Port which the application will run
EXPOSE 3000

# Command to run when the container is up
CMD ["serve", "-s", "dist"]