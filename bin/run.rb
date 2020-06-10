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
        @current_user = @prompt.select("Which user are you?", User.all)
        p "Welcome back #{@current_user.name}."

    elsif @user_type == "new_user"
        p "What is your name?"
        @current_user_name = gets.chomp
        p "How old are you?"
        @current_user_age = gets.chomp
        p "Yalie, what residential college are you in?"
        @current_user_college = gets.chomp
        @current_user = User.create(name: @current_user_name, age: @current_user_age, college: @current_user_college)
        p "Welcome to the app #{@current_user.name}. Have fun!"
    end
    menu
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

start




# p "What is your name?"
# name = gets.chomp

# p "Welcome King #{name}"


# prompt.yes?("Do you like doritos?")



puts "HELLO WORLD"
