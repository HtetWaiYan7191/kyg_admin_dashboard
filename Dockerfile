# syntax = docker/dockerfile:1

# Define the Ruby version from .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.0
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Set working directory inside the container
WORKDIR /app

# Environment variables for bundler and Rails
ENV RAILS_ENV=development \
  BUNDLE_WITHOUT="test"

# Install dependencies for building gems, Node.js for JavaScript, Yarn, and PostgreSQL client libraries
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
  build-essential \
  curl \
  git \
  libpq-dev \
  nodejs \
  npm \
  libvips \
  pkg-config

# Install Yarn for ESBuild and other JavaScript package management
RUN npm install -g yarn

# Install Bundler version 2.5.7 and ensure it's used
RUN gem install bundler -v 2.5.7
ENV BUNDLER_VERSION=2.5.7

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems inside the container
RUN bundle install

# Copy the rest of the app code
COPY . .

# Install JavaScript dependencies using Yarn (for ESBuild)
RUN yarn install

# Precompile bootsnap code for faster boot times (optional, but recommended for speed)
RUN bundle exec bootsnap precompile app/ lib/

# Create and own the runtime files as a non-root user for security
# RUN useradd -m rails && chown -R rails:rails /app
# USER rails

# Expose port 3000 for Rails server
ENTRYPOINT ["./bin/docker-entrypoint"]

EXPOSE 3000

# Define the default command to run when the container starts
CMD ["./bin/rails", "server"]