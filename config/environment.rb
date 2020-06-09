require 'bundler/setup'
Bundler.require

require 'net/http'
require 'open-uri'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
