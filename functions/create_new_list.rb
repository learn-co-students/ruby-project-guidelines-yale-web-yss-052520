require_relative '../config/environment'

def create_new_list

    system("clear")
    puts "Create New List"
    puts "-"*100
    sleep(0.5)

    confirm = false
    until confirm == true
        title = $prompt.ask("Type in a title:", required: true)
        description = $prompt.ask("Put a description:", required: true)

        puts "List: #{title}"
        puts "Description: #{title}"

        confirm = $prompt.yes?('Do you want to create this list')
        if confirm = true
            puts "List created!"
            # new_list = List.create(name: title, description: description)
        end


    end

    create_new_list_menu

end




# helper method that asks for title 

# def ask_for_title
#     title = $prompt.ask("Type in a title:", required: true)
# end

# def ask_for_description
#     description = $prompt.ask("Put a description:", required: true)
# end