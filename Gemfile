source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.1.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 5.2'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'awesome_print', require: false
gem 'devise'
gem 'slim-rails'
gem 'jquery-rails'
gem 'bootstrap', '~> 4.6.0'
gem 'font_awesome5_rails'
gem 'carrierwave'

group :development, :test do
  gem 'pry-rails', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'faker'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.4.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov', require: false
  gem 'shoulda', '~> 4.0'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
