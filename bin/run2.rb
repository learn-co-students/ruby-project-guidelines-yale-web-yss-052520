require_relative '../config/environment'
require "tty-prompt"
$prompt = TTY::Prompt.new


def initial_screen
    system("clear")
    hello = $prompt.ask('What is your name?')    
    puts "Hi #{hello}! Welcome to your reading lists!"
    puts "-"*100
    sleep(1)
end

def main_menu
    $prompt.select("What do you want to do?") do |menu|
    menu.choice "View Lists", -> {view_lists}
    menu.choice "New List", -> {create_new_list}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
end

def create_new_list_menu
    $prompt.select("What do you want to do now?") do |menu|
    menu.choice "View My Lists", -> {view_lists}
    menu.choice "Another List", -> {create_new_list}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
    system("clear")
end

initial_screen
main_menu