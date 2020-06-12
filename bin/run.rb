require_relative '../config/environment'

def start_with_name 
    puts "Hello! What is your name?".colorize(:yellow)
    name = gets.chomp
    while name == ""
        puts "You have entered nothing. Please enter your name.".colorize(:red)
        name = gets.chomp
    end
    puts "Thank you for using our app, #{name}.".colorize(:yellow)
    sleep(0.8)
    name
end 

def question 
    puts "Would you like to send an email to officials near you regarding police brutality and the Black Lives Matter movement?".colorize(:yellow)
    answer = gets.chomp 
    if answer.downcase == "yes"
        return 
    elsif answer.downcase == "no" 
        puts "Are you sure? We will provide you with an email template. All you have to do is use the link we give and click send!".colorize(:light_green)
        new_answer = gets.chomp
        if new_answer.downcase == "yes" 
            puts "Okay. Goodbye.".colorize(:light_green)
            exit(0)
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
    user_address
end 

def comment 
    puts "Would you like to include your own comment in the email, something to say to your representatives?".colorize(:yellow)
    comment_choice = gets.chomp
    if comment_choice.downcase == "yes" 
        puts "What would you like to say in the email?".colorize(:yellow)
        $user_comment = gets.chomp
    elsif comment_choice.downcase == "no"
        return 
    else 
        puts "Please answer with yes or no.".colorize(:red)
        comment
        sleep(1.0)
    end
    $user_comment
end 

def seeRepresentatives(user)
	puts "We are finding officials near you.".colorize(:yellow)
    sleep(0.8)

	puts "Would you like to see all your elected officials?".colorize(:yellow)
	response = gets.chomp
	if response.downcase == "yes" or response.downcase == "y"
        user.printOfficials
        puts "\nOf those, here are the ones that you can email:\n"
        user.printEmailableOfficials
    elsif response.downcase == "no" or response.downcase == "n"
        return
    else 
        puts "Please answer with yes or no.".colorize(:red)
        sleep(1.0)
    end
end

def printLink(user)
	puts "Would you like to email all your representatives or just a random one?".colorize(:yellow)
	response = gets.chomp
	putsMessage = "Under an official's name is a link. Copy and paste the entire thing into your browser's navigation bar to open the email!".colorize(:green)
	if response.downcase == "all"
		puts putsMessage
        user.printOfficialAndLinkForAllEmails
    elsif response.downcase == "one"
    	puts putsMessage
        user.printOneRandomEmailWithOfficialAndLink
    else 
        puts "Please answer with all or one.".colorize(:red)
        sleep(1.0)
    end
    puts "Another email?".colorize(:yellow)
    response2 = gets.chomp
    if response2.downcase == "yes"
    	printLink(user)
    elsif response2.downcase == "no"
    	puts "Ok! Bye."
    else 
        puts "Please answer with yes or no.".colorize(:red)
        printLink(user)
        sleep(1.0)
    end
end 

def startup
	name = start_with_name
	question
	user_address = address
	# binding.pry
	comment
	# binding.pry
	user1 = User.create(name: name, address: user_address, comment: $user_comment)
	user1.createAllOfficialsAndEmailsForUser
	user1
end

def giveResults(user) 
	seeRepresentatives(user)
	printLink(user)
end

user = startup
giveResults(user)

binding.pry
0