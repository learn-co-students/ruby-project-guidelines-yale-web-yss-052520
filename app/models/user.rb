class User < ActiveRecord::Base
    has_many :to_dos
    has_many :tasks, through: :to_dos

    def self.make_new_user(attributes)
        User.find_or_create_by(attributes)
    end

    def destroy_completed_to_dos
        to_dos.destroy_by(complete?: true)
    end

    def all_incomplete_to_dos
        to_dos.where(complete?: false)
    end

    def all_complete_to_dos 
        to_dos.where(complete?: true)
    end

    def make_to_dos_clean(array)
        array.map do |to_do|
            "#{to_do.task.name}, #{to_do.task.category}, #{to_do.task.due_date.strftime('%a %d %b %Y')}, #{to_do.priority_level}, internal_id: #{to_do.id}"
        end
    end

    def update_priorities
        to_dos.each do |to_do|
            if to_do.task.due_date == Date.today || to_do.task.due_date == Date.today.next #|| to_do.task.due_date - Date.today < 0
                to_do.mark_priority
            end
        end
    end

    def get_priority_to_dos
        self.update_priorities
        all_incomplete_to_dos.where(priority_level: 5) 
    end
  
    def self.all_usernames
        all.map do |user|
            user.username
        end
    end

    def self.username_exists?(username)
        User.all_usernames.include?(username)
    end     
    
    
end