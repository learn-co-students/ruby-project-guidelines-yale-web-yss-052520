class Game

    @@prompt = TTY::Prompt.new

    def self.start
        Game.clear_term
        puts "title"
        Game.main_menu
        # runs the program
    end

    def self.main_menu
        select = @@prompt.select('','New Game', 'Exit')

        #case select
        #when "New Game"
         #   Game.new_game
        #when "Exit"
         #   Game.exit_game
        #end
        if select == 'New Game'
            Game.new_game
        else select == 'Exit'
            Game.exit_game
        end
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
        name = @@prompt.ask("What is your name?")
        @@player = Player.create(name: name, bag_count: 0, location_id: 1)
    end




end