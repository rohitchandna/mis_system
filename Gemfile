source 'https://rubygems.org'

RAILS_VERSION = '~> 3.2.17'
DM_VERSION    = '~> 1.2.0'

gem 'activesupport',  RAILS_VERSION, :require => 'active_support'
gem 'actionpack',     RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',   RAILS_VERSION, :require => 'action_mailer'
gem 'activeresource', RAILS_VERSION, :require => 'active_resource'
gem 'railties',       RAILS_VERSION, :require => 'rails'
gem 'tzinfo',         '~> 0.3.32'

gem 'dm-rails',               '~> 1.2.1'
#gem 'dm-sqlite-adapter', DM_VERSION

# You can use any of the other available database adapters.
# This is only a small excerpt of the list of all available adapters
# Have a look at
#
#  http://wiki.github.com/datamapper/dm-core/adapters
#  http://wiki.github.com/datamapper/dm-core/community-plugins
#
# for a rather complete list of available datamapper adapters and plugins

# gem 'dm-sqlite-adapter',    DM_VERSION
# gem 'dm-mysql-adapter',     DM_VERSION
gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION
gem 'bootstrap-datepicker-rails', :require => 'bootstrap-datepicker-rails', :git => 'git://github.com/Nerian/bootstrap-datepicker-rails.git'

gem 'dm-migrations',   DM_VERSION
gem 'dm-types',        DM_VERSION
gem 'dm-validations',  DM_VERSION
gem 'dm-constraints',  DM_VERSION
gem 'dm-transactions', DM_VERSION
gem 'dm-aggregates',   DM_VERSION
gem 'dm-timestamps',   DM_VERSION
gem 'dm-observer',     DM_VERSION

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '~> 1.2.4'
end
gem 'dm-devise'

gem 'devise'
gem 'carrierwave-datamapper', :require => 'carrierwave/datamapper'	
gem 'cancan', :git => "https://github.com/ryanb/cancan.git", :branch => "2.0"
gem "twitter-bootstrap-rails", "~> 2.0.5" 
gem 'jquery-rails', '~> 2.0.1'
gem "mini_magick"
gem 'crack'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.1'

# Use unicorn as the web server
# gem 'unicorn', '~> 4.2.1'

# Deploy with Capistrano
# gem 'capistrano', '~> 2.11.2'

# To use debugger
# gem 'ruby-debug19', '~> 0.11.6', :require => 'ruby-debug'


  # Pretty printed test output
  

group :test, :development do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'debugger'
  gem 'turn', '~> 0.9.4', :require => false
  gem 'rspec'
  gem "rspec-rails", "~> 2.0"
  gem 'dm-rspec2'
  gem 'factory_girl'	
gem 'turn', '~> 0.9.4', :require => false
end
