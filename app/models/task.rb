class Task < ActiveRecord::Base
    has_many :to_dos
    has_many :users, through: :to_dos
end