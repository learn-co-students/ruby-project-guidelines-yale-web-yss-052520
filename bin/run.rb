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

def password_trial
    p "Type in your password."
    typed_password = @prompt.mask 
    
    if typed_password == @current_user.password
        p "Welcome back #{@current_user.name}."
        menu
    else
        p "Sorry, wrong password. Try again."
        password_trial 
    end
end

def returning_user_log_in
    @current_username = @prompt.ask("Please type in your proper username!")
    @current_user = User.find_by(username: @current_username)
    if @current_user
        password_trial
    else
        p "User does not exist!"
        welcome_section 
    binding.pry 
    end 
    
    password_trial 
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
    ))

    if @menu_choice == "view_priority_to_dos"
        view_priority_to_dos    
    elsif @menu_choice == "view_all_to_dos"
        view_all_to_dos 
    elsif @menu_choice == "new_to_do"
        new_to_do
    elsif @menu_choice == "old_to_dos"
        old_to_dos
    end
end

def view_all_to_dos
    # choices = []
    # choices.push(@current_user.all_incomplete_tasks).flatten
    choices = @current_user.make_to_dos_clean(@current_user.all_incomplete_to_dos)
    add_back_to_menu_and_select_choice(choices)
    select_to_do 
end

def add_back_to_menu_and_select_choice(array)
    back_to_menu = "back_to_menu"
    array << back_to_menu 
    @selected_choice = @prompt.select("Your to_dos", array)
    # binding.pry
    # 0
end

def view_priority_to_dos
    

    choices = @current_user.make_to_dos_clean(@current_user.get_priority_to_dos)
    add_back_to_menu_and_select_choice(choices)
    select_to_do
end

def old_to_dos
    @old_to_do_choice = @prompt.select("What would you like to do?", %w(
        view_old_to_dos 
        delete_old_to_dos 
        back_to_menu
        ))
    old_to_do_choice
end

def old_to_do_choice
    if @old_to_do_choice == "view_old_to_dos"
        view_old_to_dos 
    elsif @old_to_do_choice == "delete_old_to_dos"
        @sure_of_deletion = @prompt.yes?("Are you sure you want to delete all old to-dos?")
        if @sure_of_deletion == true 
            delete_old_to_dos 
        else
            old_to_dos
        end
    elsif @old_to_do_choice == "back_to_menu"
        menu 
    end         
end

def delete_old_to_dos
    @current_user.destroy_completed_to_dos
    p "All of your complete to_dos have been deleted!"
    menu 
end

def view_old_to_dos
    choices = @current_user.make_to_dos_clean(@current_user.all_complete_to_dos)
    add_back_to_menu_and_select_choice(choices)
    select_old_to_do
end

def select_old_to_do
    if @selected_choice == "back_to_menu"
        menu
    else
        get_selected_to_do 
        @to_do_choice = @prompt.select("What would you like to do with this to_do?", %w(
            delete_to_do
            mark_incomplete
        ))
        if @to_do_choice == "delete_to_do"
            delete_to_do 
        elsif @to_do_choice == "mark_incomplete"
            mark_incomplete 
        end
    end
end


def get_selected_to_do
    selected_choice_array = @selected_choice.split(/[(, ):]+/)
    selected_to_do_id = selected_choice_array[8]
    @selected_to_do = ToDo.find(selected_to_do_id)
end

def select_to_do
    if @selected_choice == "back_to_menu"
        menu
    else
        get_selected_to_do 
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
    menu 
end

def mark_incomplete
    @sure_of_incompletion = @prompt.yes?("Are you sure you want to mark a previously completed To-Do as incomplete?")
    if @sure_of_incompletion == true 
        @selected_to_do.mark_incomplete
        p "#{@selected_to_do.task.name} has been marked incomplete. Here are your old to-dos again!" 
        view_old_to_dos 
    else
        old_to_dos
    end    
end

def delete_to_do
    @selected_to_do.destroy
    p "#{@selected_to_do.task.name} has been deleted."
    old_to_dos 
end

def edit_to_do
    @edit_to_do = @prompt.yes?("In order to edit a To-Do, we will simply delete the old to-do and add a new one, are you okay with this?")
    further_edit_to_do
end

def further_edit_to_do
    if @edit_to_do == true 
        delete_to_do
        new_to_do 
    else
        menu 
    end
end

def new_to_do
    p "Okay, let's make a new To-Do!"
    @user_category = @prompt.select("Please choose or make a new categroy for your task.", Task.task_categories.push("make_new_category"))
    if @user_category == "make_new_category"
        @user_category = @prompt.ask("What do you want to name this category (think subject, class, or type of activity)?")
    end
    find_category
end

def task_names_plus_make_new
    array = Task.names 
    make_new_name = "No!_make_new_name"
    array << make_new_name
    array 
end

def find_category
    if Task.find_by(@user_category)
        @selected_name = @prompt.select("Do you recognize any of these assignment names?", %w(
            task_names_plus_new
        ))
        if @selected_name = "No!_make_new_name"
            make_new_task
        else
            @selected_task = Task.find_by(name: @selected_name, category: @user_category)
            @confirm_task = @prompt.yes?("Is this: (#{@selected_task}) your task?")
            if @confirm_task == true 
                make_to_do  
    end
             

end

def make_to_do 
    
end

start




# p "What is your name?"
# name = gets.chomp

# p "Welcome King #{name}"


# prompt.yes?("Do you like doritos?")



puts "HELLO WORLD"
