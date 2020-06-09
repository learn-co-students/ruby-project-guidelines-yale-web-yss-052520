class User < ActiveRecord::Base
    has_many :to_dos
    has_many :tasks, through: :to_dos
end