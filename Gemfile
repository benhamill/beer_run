source 'http://rubygems.org'

gem 'rails', '~> 3.1'

gem 'pg'
gem 'thin'

gem 'devise'
gem 'slim'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'bootstrap-sass'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'rspec-rails'
end

group :development do
  gem 'heroku'

  # Dependencies for generating slim views for Devise per
  # https://github.com/plataformatec/devise/wiki/How-To:-Create-Haml-and-Slim-Views
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'haml'
  gem 'haml2slim'
end
