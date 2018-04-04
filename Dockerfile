FROM lsioarmhf/nginx-armhf:latest

# set version label
ARG H5AI_VERSION=0.29.0

RUN \
 apk add --no-cache \
  libarchive-tools

RUN curl -k -s https://release.larsjung.de/h5ai/h5ai-${H5AI_VERSION}.zip | bsdtar -xf- -C /var/www/localhost/htdocs && \
    chown abc:abc /var/www/localhost/htdocs/_h5ai/public/cache/ && \
    chown abc:abc /var/www/localhost/htdocs/_h5ai/private/cache/

COPY root/ /
