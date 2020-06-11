class Task < ActiveRecord::Base
    has_many :to_dos
    has_many :users, through: :to_dos

    def self.make_new_task(attributes)
        Task.find_or_create_by(attributes)
    end

    def self.task_categories
        Task.all.map{|task| task.category}
    end

    def Task.find_tasks_by_category(category)
        Task.where(category: category)
    end

    def self.find_names_by_category(category)
        Task.find_tasks_by_category(category).map{|task| task.name }
    end

    def clean_look
        "name: #{self.name}, category: #{self.category}, due date: #{self.due_date.strftime('%a %d %b %Y')}"
    end
end