require 'bundler/setup'
Bundler.require
#require_all '/Users/larissanguyen/Documents/Code/flatiron_bootcamp/ruby-project-guidelines-yale-web-yss-052520/app'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', 
    database: 'db/development.db')

ActiveRecord::Base.logger = nil    
require_all 'lib'
require_all 'app'
require 'colorize'


