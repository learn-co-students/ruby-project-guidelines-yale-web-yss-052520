class Team < ActiveRecord::Base
    has_many :team_to_dos
    has_many :team_users
    has_many :users, through: :team_users


    def self.all_names
        self.all.map do |team|
            team.name
        end
    end

    def self.name_exists?(typed_in_team_name)
        self.all_names.include?(typed_in_team_name)
    end

    def team_to_dos_clean_string
        self.team_to_dos.map do |to_do|
            "#{to_do.name} #{to_do.status} due_date:#{to_do.due_date}"
        end
    end

end