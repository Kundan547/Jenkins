# Use the Nginx image
FROM nginx:alpine

# Copy the application code to the Nginx web server directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
