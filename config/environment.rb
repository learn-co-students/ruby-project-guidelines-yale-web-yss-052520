require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

ActiveRecord::Base.logger = nil
require_all 'lib'
require_all 'functions'
$prompt = TTY::Prompt.new
# require "tty-prompt"