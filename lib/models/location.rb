class Location < ActiveRecord::Base
    has_many :items
    has_many :players, through: :items
    belongs_to :npc
end