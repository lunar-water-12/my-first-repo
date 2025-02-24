# Use an official Apache image as the base
FROM httpd:latest

# Copy custom website files to Apache root directory
COPY ./public-html/ /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["httpd-foreground"]

# Create a simple index.html page
RUN mkdir -p /usr/local/apache2/htdocs && echo "<h1>Welcome to My Apache Server</h1>" > /usr/local/apache2/htdocs/index.html
