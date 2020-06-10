require_relative '../config/environment'

def view_all
    system("clear")
    puts "My Lists"
    puts "-"*100
    sleep(0.5)

    array1 = List.all.map do |list| 
        list.name 
    end

    array2 = List.all
    hash = array1.zip(array2).to_h
    # array = List.select(:name)
    selected = $prompt.select("Select list:", hash)
    puts selected
    # view_list(selected)
end
#iterate and make a menu into a list?

#pass into the selected menu into view_list(as an arg)
0