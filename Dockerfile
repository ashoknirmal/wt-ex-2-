# Use an Nginx base image
FROM nginx:alpine

# Copy website files to Nginx's default HTML directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
