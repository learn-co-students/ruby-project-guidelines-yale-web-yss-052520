def delete_list(list)
  confirm = $prompt.yes?('Are you sure you want to delete this list?', convert: :boolean)
  if confirm == true
      list.destroy
      system("clear")
      puts "#{list.name} has been deleted."
      main_menu
  end
end