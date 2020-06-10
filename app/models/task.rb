class Task < ActiveRecord::Base
    has_many :to_dos
    has_many :users, through: :to_dos

    def self.make_new_task(attributes)
        Task.find_or_create_by(attributes)
    end
end