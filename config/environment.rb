require 'bundler'
require 'pry'
require 'require_all'
require 'system'
require_all 'app/models'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

$CHECKERBOARD_INITIAL = [
"⬜🔵⬜⬛⬜🔴⬜🔴",
"🔵⬜🔵⬜⬛⬜🔴⬜",
"⬜🔵⬜⬛⬜🔴⬜🔴",
"🔵⬜🔵⬜⬛⬜🔴⬜",
"⬜🔵⬜⬛⬜🔴⬜🔴",
"🔵⬜🔵⬜⬛⬜🔴⬜",
"⬜🔵⬜⬛⬜🔴⬜🔴",
"🔵⬜🔵⬜⬛⬜🔴⬜"
].join("\n")