class ToDo < ActiveRecord::Base
    belongs_to :task
    belongs_to :user

    # def self.get_priority
    #     priority = ToDo.where(priority_level: 5)
    #     priority << ToDo.where((task.due_date <=> Date.today.next) = 0)
    #     priority << ToDo.where((task.due_date <=> Date.today = 0)
    #     priority << ToOo.where((task.due_date <=> Date.today) = -1)
    #     priority.flatten.destroy_by(complete?: true)
    #     priority 
    # end

    def self.all_incomplete_tasks
        all_incomplete_tasks = ToDo.where(complete?: false) 
    end

    def self.all_complete_tasks
        all_complete_tasks = ToDo.where(complete?: true)
    end

    def delete_specified_todo
        self.destroy
    end

    def mark_priority
        self.update(priority_level: 5)
    end

    def mark_complete
        self.update(complete?: true)
    end

    def mark_incomplete
        self.update(compete?: false)
    end

    def self.destroy_all_complete_tasks
        ToDo.destroy_by(complete?: true)
    end
# To make this method work, from the command line, we want the user to input name, college and age for user instance, throw in category, and relevant details for task
# Will likely want to structure into a hash prior to passing into make_to
    def make_todo(attributes)
        ToDo.create(attributes)
    end
end