FROM ruby:2.7.1

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get update -qq && \
  apt-get install -y vim nodejs sqlite3 libsqlite3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/

RUN gem install bundler -v 2.2.15 && \
  bundle install --jobs 20

COPY . /app