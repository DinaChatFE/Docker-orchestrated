# Use an official Node.js runtime as the base image
FROM node:14 AS build

# Create and set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application (use your specific build command)
RUN npm run build

# Use a lightweight web server to serve the static React build
FROM nginx:alpine

# Copy the build files from the previous stage to the nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to serve the application
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
