# Use an official Node.js runtime
FROM node:16-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app
COPY . .

# Expose the port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
