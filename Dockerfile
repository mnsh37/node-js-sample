# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the entire application
COPY . .

# Expose port 5000 (used by the Heroku sample app)
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
