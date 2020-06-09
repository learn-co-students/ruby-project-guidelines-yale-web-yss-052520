require 'bundler'
require 'date'
require 'time'

Bundler.require
# require 'active_record'
# require 'rake'
require_all 'app/models'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'db'





# # require 'active_record'
# # require 'rake'
# # require_all 'app/models'

#  ENV["ACTIVE_RECORD_ENV"] ||= "development"

#  ActiveRecord::Base.establish_connection(ENV["ACTIVE_RECORD_ENV"].to_sym)

# ActiveRecord::Base.logger = nil

# if ENV["ACTILVLE_RECORD_ENV"] == "test"
#   ActiveRecord::Migration.verbose = false
# end
