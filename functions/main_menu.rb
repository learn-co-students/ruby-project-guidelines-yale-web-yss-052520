require_relative '../config/environment'

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