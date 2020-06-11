require_relative '../config/environment'
@prompt = TTY::Prompt.new

def start
    welcome_section
end

def welcome_section
    @user_type = @prompt.select("Hello, which of these are you?", %w(returning_user new_user))
    log_in_section
end

def log_in_section
    if @user_type == "returning_user"
        returning_user_log_in

    elsif @user_type == "new_user"
        new_user_sign_up_info
    end
end

def returning_user_log_in
    @current_username = @prompt.select("Which user are you?", User.all_usernames)
    @current_user = User.find_by(username: @current_username)
    
    p "Type in your password."
    typed_password = gets.chomp #mask this password
    
    if typed_password == @current_user.password
        p "Welcome back #{@current_user.name}."
        menu
    else
        p "Sorry, wrong password. Try again."
        log_in_section
    end
end

def new_user_sign_up_info
    p "What is your name?"
    @current_user_name = gets.chomp

    p "How old are you?"
    @current_user_age = gets.chomp

    p "Yalie, what residential college are you in?"
    @current_user_college = gets.chomp

    new_username
end

def new_username
    p "This is important. Please type in a unique username"
    typed_in_username = gets.chomp

    if User.username_exists?(typed_in_username)
        p "Sorry, this username exists already."
        new_username
    else
        @current_username = typed_in_username
        p "Nice! Remember your username is #{@current_username}"
    end
    
    new_password
end

def new_password
    typed_in_password_1 = @prompt.mask("Type in a password")
    typed_in_password_2 = @prompt.mask("Type it in again please")
    
    if typed_in_password_1 == typed_in_password_2
        @current_user = User.create(name: @current_user_name, age: @current_user_age, college: @current_user_college, username: @current_username, password: @current_user_password)
        p "Welcome to the app, #{@current_user.name}."
        menu
    else
        p "Passwords didn't match. Try again."
        new_password
    end
end

def menu
    @menu_choice = @prompt.select("What would you like to do today?", %w(
        view_priority_to_dos
        view_all_to_dos
        new_to_do
        old_to_dos
        teams
    ))

    if @menu_choice == "view_priority_to_dos"
        priority_to_dos    
    elsif @menu_choice == "view_all_to_dos"
        all_to_dos
    elsif @menu_choice == "new_to_do"
        new_to_do
    elsif @menu_choice == "old_to_dos"
        old_to_dos
    elsif @menu_choice == "teams"
        teams
    end
end

def teams
    @teams_choice = @prompt.select("Teamwork makes the dreamwork. What do you want to do?", %w(
        my_teams
        join_team
        create_team
        back_to_menu
    ))

    if @teams_choice == "my_teams"
        my_teams
    elsif @teams_choice == "join_team"
        join_team
    elsif @teams_choice == "create_team"
        create_team
    elsif @teams_choice == "back_to_menu"
        menu
    end
end

def my_teams
    choices = @current_user.all_team_names
    choices.push("back_to_teams")
    @my_teams_choice = @prompt.select("Choose the team you want to go to.", choices) #methods that show all teams
    if @my_teams_choice == "back_to_teams"
        teams
    elsif
        @current_team = Team.find_by(name: @my_teams_choice)
        current_team_menu
    end
end

def current_team_menu
    @current_team_menu_choice = @prompt.select("You are in #{@current_team.name}. What would you like to do?", %w(
        view_team_to_dos
        view_chosen_to_dos
        create_team_to_do
        back_to_my_teams
    ))
    if @current_team_menu_choice == "view_team_to_dos"
        view_team_to_dos
    elsif @current_team_menu_choice == "view_chosen_to_dos"
        view_chosen_to_dos
    elsif @current_team_menu_choice == "create_team_to_do"
        create_team_to_do
    elsif @current_team_menu_choice == "back_to_my_teams"
        my_teams
    end
end

def view_team_to_dos
    choices = @current_user.team_to_dos
    choices.push("back_to_team_menu")
    @view_team_to_dos_choice = @prompt.select("Select a to_do you want to claim", choices)
    if @view_team_to_dos_choice == "back_to_team_menu"
        current_team_menu
    else
        @view_team_to_dos_choice.user_id = @current_user.id
        @view_team_to_dos_choice.colorize(:red)
        p "#{@view_team_to_dos_choice.name} has been added to chosen_to_dos"
        view_team_to_dos
    end
end

def view_chosen_to_dos
    choices = @current_user.team_to_dos
    choices.push("back_to_team_menu")
    view_chosen_to_dos_choice = @prompt.select("Here are your claimed to_dos", choices)
    if view_chosen_to_dos_choice == "back_to_team_menu"
        current_team_menu
    else
        @current_team_to_do = view_chosen_to_dos_choice
        current_team_to_do
    end
end

def current_team_to_do
    current_team_to_do_choice = @prompt.select("What would you like to do?", %w(
        back
        mark_complete
        unclaim
    ))
    if current_team_to_do_choice == "back"
        view_chosen_to_dos
    elsif current_team_to_do_choice == "mark_complete"
        mark_chosen_to_do_complete
    elsif current_team_to_do_choice == "unclaim"
        unclaim_chosen_to_do
    end
end

def mark_chosen_to_do_complete
    @current_team_to_do.mark_complete #build this
    @current_team_to_do.colorize(:green)
    @current_team_to_do.unclaim
    p "Congrats! You completed #{@current_team_to_do.name}"
    view_chosen_to_dos
end

def unclaim
    @current_team_to_do.unclaim #build this
    @current_team_to_do.colorize(:default)
    p "#{@current_team_to_do.name} has been unclaimed"
    view_chosen_to_dos
end

def create_team_to_do
    p "What is the name if this team_to_do"
    typed_in_name = gets.chomp
    p "When is this due?"
    typed_in_date = gets.chomp #how do i work this with datetime? Or I could change type for due_date with migration
    new_team_to_do = TeamToDo.create(name: typed_in_name, due_date: typed_in_date, team_id: @current_team.id, complete?: false)
    p "Success! #{new_team_to_do.name} has been added to #{@current_team.name} to_dos"
    current_team_menu
end

def join_team
    choices = @current_user.unjoined_team_names
    choices.push("back_to_teams")
    join_team_choice = @prompt.select("Which team would you like to join?", choices)
    if join_team_choice == "back_to_teams"
        teams
    else
        @current_team = Team.find_by(name: join_team_choice)
        join_team_sign_in
    end
end

def join_team_sign_in
    typed_in_password = @prompt.mask("Type in the password for #{@current_team.name}")
    if typed_in_password == @current_team.password
        TeamUser.create(user_id: @current_user.id, team_id: @current_team.id)
        p "#{@current_team.name} has been added to my_teams"
        join_team
    else
        p "Sorry, wrong password. Try again."
        join_team_sign_in
    end
end

def create_team
    p "What would you like to name this team?"
    typed_in_team_name = gets.chomp

    if Team.name_exists?(typed_in_team_name)
        p "Sorry, this username exists already."
        create_team
    else
        @new_team_name = typed_in_team_name
        p "Nice! Remember this team's name is #{@new_team_name}"
    end
    create_team_password
end

def create_team_password
    typed_in_password_1 = @prompt.mask("Type in a password. This is required for those who want to join this team.")
    typed_in_password_2 = @prompt.mask("Type it in again please")
    
    if typed_in_password_1 == typed_in_password_2
        @new_team_password = typed_in_password_2
        @new_team = Team.create(name: @new_team_name, password: @new_team_password)
        TeamUser.create(team_id: @new_team.id, user_id: @current_user.id)
        p "Congrats! You made a new team called #{@new_team.name}."
        teams
    else
        p "Passwords didn't match. Try again."
        create_team_password
    end
end


def all_to_dos
    # choices = []
    # choices.push(@current_user.all_incomplete_tasks).flatten
    choices = @current_user.all_incomplete_tasks_clean
    choices.push("back_to_menu")
    selected_choice = @prompt.select("Your to_dos", choices)
    if selected_choice == "back_to_menu"
        menu
    else
        selected_choice_array = selected_choice.split(", ")
        selected_to_do_id = selected_choice_array[4]
        @selected_to_do = ToDo.find(selected_to_do_id)
        @to_do_choice = @prompt.select("What would you like to do with this to_do?", %w(
            mark_complete
            edit_to_do
            delete_to_do
        ))
        if @to_do_choice == "mark_complete"
            mark_complete
        elsif @to_do_choice == "edit_to_do"
            edit_to_do
        elsif @to_do_choice == "delete_to_do"
            delete_to_do
        end
    end
end

def mark_complete
    @selected_to_do.mark_complete
    p "#{@selected_to_do.task.name} is complete. Congratulations!"
    all_to_dos
end

def delete_to_do
    @selected_to_do.destroy
end

    

start




# p "What is your name?"
# name = gets.chomp

# p "Welcome King #{name}"


# prompt.yes?("Do you like doritos?")

#After you log in
    #add "teams" option
        #my_teams
            #view team_to_dos
                #claim to_do
                    #once claimed, changes to red
                    #adds to chosen to_dos
                #again, chosen/incomplete todos show up red
                #completed todos show up green
            #chosen to_dos
                #mark_complete
                #unclaim to_do
            #create a team to_do
                
                            
            #leave team
        #join_a_team
        #create_a_team
#gonna need a team.all_names
#team.password
#Team class
#team and user joiner class (has_many has_many relationship)
#Team_to_do class


puts "HELLO WORLD"
