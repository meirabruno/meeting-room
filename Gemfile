source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'jbuilder', '~> 2.5'
gem 'devise'

# Frontend stuff
gem 'babel-transpiler'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', github: 'plataformatec/simple_form', branch: 'master'
gem 'slim'
gem 'sprockets-rails', github: 'rails/sprockets-rails', branch: 'master'
gem 'sprockets', github: 'rails/sprockets', branch: 'master'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.6'

source 'https://rails-assets.org' do
  gem 'rails-assets-almond'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'better_errors'
  gem 'rubocop'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'capybara-webkit'
end

gem 'rails_12factor', group: [:staging,:production]
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
