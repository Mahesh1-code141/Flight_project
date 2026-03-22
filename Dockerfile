FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy project files
COPY . /usr/share/nginx/html

# Fix permissions so Nginx user can read them
RUN chown -R nginx:nginx /usr/share/nginx/html \
    && chmod -R 755 /usr/share/nginx/html

# Expose default Nginx port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
