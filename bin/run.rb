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
    typed_password = gets.chomp
    
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
    ))

    if @menu_choice == "view_priority_to_dos"
        priority_to_dos    
    elsif @menu_choice == "view_all_to_dos"
        all_to_dos
    elsif @menu_choice == "new_to_do"
        new_to_do
    elsif @menu_choice == "old_to_dos"
        old_to_dos
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



puts "HELLO WORLD"
