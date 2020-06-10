class Game

    @@prompt = TTY::Prompt.new

    def self.start
        Game.clear_term
        puts "title"
        Game.main_menu
        # runs the program
    end

    def self.main_menu
        self.clear_term
        puts "MAIN MENU"

        select = @@prompt.select('','New Game', 'Help', 'Exit')

        case select
        when "New Game"
           Game.new_game 
        when "Help"
            Game.help_menu
        when "Exit"
           Game.exit_game
        end
    
        # if select == 'New Game'
        #     Game.new_game
        # else select == 'Exit'
        #     Game.exit_game
        # end
        #draws the choices for the menu
    end 

    def self.new_game
        Game.player
        #begins a new game for player
    end

    def self.exit_game
        Game.clear_term
        puts "Thanks for playing"
        exit
        #exits game and closes terminal
    end 

    def self.clear_term
        system('clear') || system('cls') # clears the terminal
    end

    def self.player
        puts 
        select_player_name = @@prompt.ask("What is your name?")
        @@player = Player.create(name: select_player_name, bag_count: 0, location_id: 1)
        Game.clear_term
        Game.next_screen
    end

    def self.help_menu 
    # display help menu screen
    puts "HELP MENU"

        h_menu = @@prompt.select(' ', 'Game Info', 'Key Functions', 'Main Menu')

        case h_menu
        when "Game Info"
            ICommand.game_info
        when "Key Functions"
            ICommand.use_and_display
        when "Main Menu"
            Game.main_menu
        end
        #add back function
    end

    def self.intro
    Game.slow_puts("asdfadf \nasdfads \nasdfad")
    end

    def self.next_screen
        puts "Title"
        Game.intro
        sleep(5)
        Game.clear_term
        ICommand.display_key_funcs
        sleep(2)
        Game.gameplay_screen
    end

    def self.slow_puts(string)
        string.each_char {|char| sleep(0.05); print char}
        print "\n"
   end

   def self.gameplay_screen
    Game.clear_term
    ICommand.location_display
    ICommand.key_funcs
  end


end