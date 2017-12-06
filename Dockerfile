FROM ruby:2.4.1
MAINTAINER Nick Budak <budak@lclark.edu>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0.0-rc1" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="Git" \
      org.label-schema.license="Apache-2.0" \
      org.label-schema.vcs-url="https://github.com/watzek/compass.git" \
      org.label-schema.url="https://geo.watzek.cloud/"

# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

# Install the app
COPY . /usr/src/geoblacklight
WORKDIR /usr/src/geoblacklight
RUN bundle install

# Configuration
ENV RAILS_ENV "production"
ENV RAILS_SERVE_STATIC_FILES "true"
ENV SOLR_URL "http://solr:8983/solr/geoblacklight"
ENV RABBIT_SERVER "amqp://mq:5672"
ENV DEVISE_SECRET_KEY "$(rake secret)"
ENV SECRET_KEY_BASE "$(rake secret)"

# Persist data
VOLUME ["/usr/src/geoblacklight/tmp"]

# Compile assets and expose port
RUN rake assets:precompile
EXPOSE 3000
