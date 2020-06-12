require_relative '../config/environment'
$prompt = TTY::Prompt.new


def main_menu
    system("clear")
    puts "Hi! Welcome to your reading lists!"
    puts "-"*100
    $prompt.select("Main Menu") do |menu|
        if List.all.length >=1
            menu.choice "View Lists", -> {view_all}
        end
        menu.choice "Create New List", -> {create_new_list}
        menu.choice "Exit Program", -> {exit}
    end
    system("clear")
end


# def list_menu
#     $prompt.select("What do you want to do?") do |menu|
#     menu.choice "View Book", -> {display_list_commands}
#     menu.choice "Add Book", -> {add_entry(selected)}
#     menu.choice "Exit Program", -> {exit}
#     end
#     system("clear")
# end


# def create_new_list_menu
#     $prompt.select("What do you want to do now?") do |menu|
#     menu.choice "View My Lists", -> {view_all}
#     menu.choice "Another List", -> {create_new_list}
#     menu.choice "Exit Program", -> {exit}
#     end
#     system("clear")
# end


main_menu