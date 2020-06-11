class Task < ActiveRecord::Base
    has_many :to_dos
    has_many :users, through: :to_dos

    def self.make_new_task(attributes)
        Task.find_or_create_by(attributes)
    end

    def self.task_categories
        Task.all.map{|task| task.category}
    end

    def self.names
        Task.all.map {|task| task.name }
    end
end