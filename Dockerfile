FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mongodb
RUN mkdir /brainpin
WORKDIR /brainpin
COPY Gemfile /brainpin/Gemfile
COPY Gemfile.lock /brainpin/Gemfile.lock
RUN bundle install
COPY . /brainpin