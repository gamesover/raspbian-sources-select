# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '5.0.2'

gem 'foreman'
gem 'pg', '~> 0.20.0'
gem 'puma'

group :development, :test do
  gem 'dotenv-rails'
end

group :test do
  gem 'rspec_junit_formatter'
  gem 'rubocop', '~> 0.54.0', require: false
  gem 'rubocop-rspec'
end

group :development do
  gem 'bullet'
  gem 'spring'
end
