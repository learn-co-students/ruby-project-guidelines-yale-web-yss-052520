require_relative '../config/environment'

def create_new_list

    system("clear")
    puts "Create New List"
    puts "-"*100
    sleep(0.5)

    title = $prompt.ask("Type in a title:", required: true)
    description = $prompt.ask("Write a description (optional):", required: false)

    puts "List title: #{title}"
    puts "Description: #{description}"

    confirm = $prompt.yes?('Create list?', convert: :boolean)
    if confirm == true
        system("clear")
        puts "List created!"
        List.create(name: title, description: description)
        view_all
    else
        main_menu
    end

end




# helper method that asks for title 

# def ask_for_title
#     title = $prompt.ask("Type in a title:", required: true)
# end

# def ask_for_description
#     description = $prompt.ask("Put a description:", required: true)
# end