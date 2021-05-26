FROM cypress/browsers:node12.18.3-chrome89-ff86

LABEL maintainer="doanbaanh@gmail.com"

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh \
    && mkdir /e2e

WORKDIR /e2e

ENTRYPOINT ["/docker-entrypoint.sh"]
