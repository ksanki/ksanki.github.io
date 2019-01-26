FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
      build-essential \
      ca-cacert \
      ca-certificates \
      curl \
      git \
      ruby \
      ruby-dev \
      ssh \
      software-properties-common \
      wget && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 1.16.6

# After build a image from this file, you can execute jekyll by following commands:
# bundle install
# bundle exec jekyll serve

