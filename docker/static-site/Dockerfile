#
# Static site  Dockerfile
# 
#

# Pull base image.
FROM homework/nginx:latest

# Add files.
ADD index.html /var/www/html/index.html
ADD default /etc/nginx/sites-enabled/default
ADD hostname /etc/hostname

# Just an easy wasy to have something dynamic per host
RUN \
  ln -s /etc/hostname /var/www/html/


# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 8081
