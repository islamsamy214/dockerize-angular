FROM node:16-alpine

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install -g @angular/cli
RUN npm install

# Bundle app source
COPY . .

# Build the app
RUN ng build --prod

# Expose port 4200
EXPOSE 4200

# Run the app
CMD ["ng", "serve", "--host", "0.0.0.0"]
