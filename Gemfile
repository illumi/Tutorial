source 'http://rubygems.org'

gem 'rails', '3.2.2'

gem 'pg'
gem 'devise'
gem 'jquery-rails'
gem 'skeleton-rails'
gem 'rdiscount' #markdown

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  gem 'turn', :require => false
end
group :production do
  gem 'thin'
end
group :development, :test do
    gem 'railroady'
end