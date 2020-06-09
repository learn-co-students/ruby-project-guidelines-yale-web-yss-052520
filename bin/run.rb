require_relative '../config/environment'
prompt = TTY::Prompt.new

def welcome_section
    @user_type = prompt.select("Hello, which of these are you?", %w(returning_user new_user)
end

def log_in_section
    if @user_type = "returning_user"
        @current_user = prompt.select("Which user are you?", User.all_names)


p "What is your name?"
name = gets.chomp

p "Welcome King #{name}"


prompt.yes?("Do you like doritos?")



puts "HELLO WORLD"
