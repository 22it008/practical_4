# Use an official Node.js image as the base image 

FROM node:14-alpine 

# Set the working directory inside the container 

WORKDIR /app 

# Copy package.json and package-lock.json into the working directory 

COPY package*.json ./

# Install dependencies 

RUN npm install 

# Copy the rest of the application code into the working directory 
docker run -p 3000:3000 react_store

COPY . . 

# Build the React app for production 

RUN npm run build 

# Install serve globally to serve the static files 

RUN npm install -g serve 

# Set the command to serve the app 

CMD ["serve", "-s", "build"] 

# Expose the port the app runs on 

EXPOSE 3000 