# User.destroy_all 
# User.reset_pk_sequence

require 'colorize'

class CLI 
    attr_accessor :user, :user_address, :user_comment

def start_with_name 
     puts "Hello! What is your name?".colorize(:yellow)
     name = gets.chomp
     while name == ""
         puts "You have entered nothing. Please enter your name.".colorize(:red)
         name = gets.chomp
     end
    @name = name
     puts "Thank you for using our app, #{name}.".colorize(:yellow)
     sleep(0.8)
     question
end 

def question 
    puts "Would you like to send an email to officials near you regarding police brutality and the Black Lives Matter movement?".colorize(:yellow)
    answer = gets.chomp 
    if answer.downcase == "yes"
        address
    elsif answer.downcase == "no" 
        puts "Are you sure? We will provide you with an email template. All you have to do is click the link and send!".colorize(:light_green)
        new_answer = gets.chomp
        if new_answer.downcase == "yes" 
            puts "Okay. Goodbye.".colorize(:light_green)
        elsif new_answer.downcase == "no"
            question
        else puts "Please answer with yes or no.".colorize(:red)
            question
        end 
    else 
        puts "Please answer with yes or no.".colorize(:red)
        question 
    end 
end 

def address
    puts "Please enter your address so we can find officials near you.".colorize(:yellow)
    user_address = gets.chomp
    while user_address == ""
         puts "You have entered nothing. Please enter your address.".colorize(:red)
         user_address = gets.chomp
     end
     @user_address = user_address
    puts "We are finding officials near you.".colorize(:yellow)
    sleep(0.8)
    puts "We will provide you with a link to an email with a pre-written meesage.".colorize(:yellow)
    sleep(0.8)
    comment
end 

def comment 
    puts "Would you like to include your own comment in the email?".colorize(:yellow)
    comment_choice = gets.chomp
    if comment_choice.downcase == "yes" 
        puts "What would you like to say in the email?".colorize(:yellow)
        user_comment = gets.chomp
        @user_comment = user_comment
        link
    elsif comment_choice.downcase == "no"
        link 
    else 
        puts "Please answer with yes or no.".colorize(:red)
        sleep(1.0)
        comment
    end
end 

def link 
    puts "Here is a link to your email:".colorize(:yellow)
    #link here 
    User.create(name: @name, address: @user_address, comment: @user_comment)

end 

end 
