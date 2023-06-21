# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "bootsnap", require: false
gem "dartsass-rails"
gem "dockerfile-rails", '>= 1.2', group: :development
gem "faker"
gem "importmap-rails"
gem "jbuilder"
gem "kaminari"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "ransack"
gem "sorcery", '~> 0.16.5'
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  gem "web-console"
end

gem 'cssbundling-rails'
