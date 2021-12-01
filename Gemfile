# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'rake'
gem 'puma'

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'

gem 'pg'
gem 'sequel'

gem 'i18n'
gem 'config'
gem 'jwt'
gem 'sequel_secure_password'

gem 'dry-initializer'
gem 'dry-validation'

gem 'activesupport', require: false
gem 'jsonapi-serializer'

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
  gem 'database_cleaner-sequel'
end
