class TeamToDo < ActiveRecord::Base 
    belongs_to :team
    belongs_to :user

    def mark_complete
        self.update(complete?: true)
    end

    def unclaim
        self.update(user_id: nil)
    end
end