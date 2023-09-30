# Use an official Node.js runtime as the base image
FROM node:14

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

# Expose port 80 to serve the application
EXPOSE 3000

# Start the nginx server
CMD ["npx", "serve", "-s", "build", "-l", "3000"]
