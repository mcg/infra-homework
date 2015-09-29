#
# Nginx Dockerfile
# 
# Based on --- https://github.com/dockerfile/nginx
#

# Pull base image.
FROM homework/base:latest

# Install Nginx.
RUN \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 8081
