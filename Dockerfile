FROM composer
MAINTAINER jeff.tunessen@gmail.com

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /srv

RUN echo "install packages" \
    && composer global require phploc/phploc:^5.0 --no-suggest --no-ansi --no-interaction \
    && ln -s /srv/vendor/bin/phploc /usr/local/bin/phploc

ENTRYPOINT ["phploc"]
CMD ["-"]