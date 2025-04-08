# Use the official PHP image from Docker Hub
FROM php:7.4-cli

# Install dependencies (e.g., Composer)
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Composer (if needed)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory in the container
WORKDIR /app

# Copy the PHP app into the container
COPY . .

# Install PHP dependencies using Composer (if you have composer.json)
RUN composer install

# Expose the port the app will run on
EXPOSE 80

# Start the PHP built-in web server (or you can use Apache or Nginx if preferred)
CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
