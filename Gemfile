source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
 gem 'shotgun'
 gem "tux"
 gem 'pry'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end

group :development do
  gem 'sqlite3', '~> 1.3.6'
end

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end