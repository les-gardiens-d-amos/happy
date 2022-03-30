source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# Use Puma as the app server
gem "puma", "~> 5.6"

# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"
# jwt token
gem "jwt"
# Nokogiri
gem "nokogiri", ">= 1.12.5"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
# pry
gem "pry"
# dirscord bot
gem "discordrb"
gem "discordrb-webhooks"
# cloudinary
gem "cloudinary"

# code linter
gem "rubocop", "~> 1.22", require: false
gem "rubocop-rails", require: false

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "listen", "~> 3.3"
  gem "spring"
end

group :production do
  gem "mysql2", "~> 0.5.2"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
