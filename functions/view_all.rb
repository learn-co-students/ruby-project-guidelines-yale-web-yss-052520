require_relative '../config/environment'

def view_all
    system("clear")
    puts "My Lists"
    puts "-"*100
    sleep(0.5)

    array = List.all.map do |list| {list.?}
    selected = $prompt.select("What do you want to do?")
    puts List.all

    view_list(selected)
end
#iterate and make a menu into a list?

#pass into the selected menu into view_list(as an arg)
0