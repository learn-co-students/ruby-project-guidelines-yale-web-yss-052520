class Email < ActiveRecord::Base
    belongs_to :user
    belongs_to :official
end 