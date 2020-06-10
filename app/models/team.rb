class Team < ActiveRecord::Base
    has_many :team_to_dos
    has_many :users, through: :team_users
end