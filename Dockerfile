FROM ruby:3.1.3-alpine

RUN apk --update --no-cache add build-base gcompat nodejs git zsh bash curl tzdata postgresql-dev \
                     postgresql-client libxslt-dev libxml2-dev imagemagick yarn npm
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

WORKDIR /giga_app

COPY Gemfile /giga_app/Gemfile
COPY Gemfile.lock /giga_app/Gemfile.lock

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle install
