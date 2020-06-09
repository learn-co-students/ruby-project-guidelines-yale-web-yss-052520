require 'bundler'
require 'require_all'
require_all 'app/models'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
