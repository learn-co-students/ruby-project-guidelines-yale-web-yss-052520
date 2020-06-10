class User < ActiveRecord::Base
    has_many :to_dos
    has_many :tasks, through: :to_dos

    def self.make_new_user(attributes)
        User.find_or_create_by(attributes)
    end
end