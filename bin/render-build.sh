#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

bundle exec rails db:seed:users 
bundle exec rails db:seed:kings_yangon_users 
bundle exec rails db:seed:kings_yangon_office_users 
bundle exec rails db:seed:brand_categories
bundle exec rails db:seed 
