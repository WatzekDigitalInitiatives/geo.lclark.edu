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
      org.label-schema.vcs-url="https://github.com/watzek/geo.lclark.edu.git" \
      org.label-schema.url="https://geo.lclark.edu/"

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
ENV DEVISE_SECRET_KEY "$(rake secret)"
ENV SECRET_KEY_BASE "$(rake secret)"

# Persist data
VOLUME ["/usr/src/geoblacklight/tmp"]

# Start the app
RUN rake assets:precompile
CMD ["sh", "-c", "/usr/src/geoblacklight/bin/start"]
