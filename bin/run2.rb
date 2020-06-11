require_relative '../config/environment'
$prompt = TTY::Prompt.new


def main_menu
    system("clear")
    puts "Hi! Welcome to your reading lists!"
    puts "-"*100
    $prompt.select("Main Menu") do |menu|
    menu.choice "View Lists", -> {view_all}
    menu.choice "Create New List", -> {create_new_list}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
end


def list_menu
    $prompt.select("What do you want to do?") do |menu|
    menu.choice "View Book", -> {display_list_commands}
    menu.choice "Add Book", -> {add_entry(selected)}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
end


def create_new_list_menu
    $prompt.select("What do you want to do now?") do |menu|
    menu.choice "View My Lists", -> {view_all}
    menu.choice "Another List", -> {create_new_list}
    menu.choice "Exit Program", -> {exit}
    # menu.choice "Hang out for a bit", -> {hang_out(0.5,5)}
    end
    system("clear")
end


main_menu