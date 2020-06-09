require_relative '../config/environment'
require "tty-prompt"
$prompt = TTY::Prompt.new



def main_menu
    system("clear")
    hello = $prompt.ask('What is your name?')    
    puts "Hi #{hello}! Welcome to your reading lists!"
    puts "-"*100
    sleep(1)
    $prompt.select("What do you want to do?") do |menu|
    menu.choice "View Lists", -> {view_lists}
    menu.choice "New List", -> {create_new_list}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
end


main_menu