class Game

    #Gems for added customizations 
    @@artii = Artii::Base.new :font => 'speed'
    @@prompt = TTY::Prompt.new
    # @@output = AudioPlayback::Device::Output.gets

    def self.start
        Game.clear_term
        Game.title 
        sleep(2)
        Game.main_menu
        # runs the program
    end

    def self.main_menu
        self.clear_term
        puts "MAIN MENU"

        select = @@prompt.select('','New Game', 'Help', 'Exit'.colorize(:red))

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
        Game.player_prompt
        #begins a new game for player
    end

    def self.exit_game
        @@t2 = Time.now
        Game.clear_term
        puts "Thank you, #{@@player.name.colorize(:red).bold}, for playing."
        total_time = @@t2 - @@t1
        puts "Time: #{total_time}"
        exit
        #exits game and closes terminal
    end 

    def self.clear_term
        system('clear') || system('cls') # clears the terminal
    end

    def self.player_prompt
        @@t1 = Time.now
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
        Game.slow_puts("\n \nOur world is in need of rescue. In order to protect \nthe planet, you must help Queen Frostine restore the \nnatural balance by finding the five hidden gems \nscattered throughout the planet's remains. On your \njourney you may run into helpers, but remember to \nstay focused. Otherwise the Earth might just implode.")
            # "Our world is in need of rescue. In order to protect
            # the planet, you must help Queen Frostine restore the
            # natural balance by finding the five hidden gems 
            # scattered throughout the planet's remains. On your
            # journey you may run into helpers, but remember to 
            # stay focused. Otherwise the Earth might just implode."
    end

    def self.next_screen
        Game.title 
        Game.intro
        sleep(2)
        Game.clear_term
        # ICommand.display_key_funcs
        # sleep(2)
        Game.gameplay_screen
        
    end

    # controls speed of text display
    def self.slow_puts(string)
        string.each_char {|char| sleep(0.05); print char}
        print "\n"
    end

    def self.gameplay_screen
        Game.clear_term
        ICommand.move_and_display_loop
        ICommand.key_funcs
        self.background_music
    end

    def self.title
        puts @@artii.asciify("Candy Hunt").colorize(:red).bold
    end

    def self.end_game_message
        # when bag_count = 5, puts "Go to Final Flan", && location_id == 17
        if self.bag.count == 5 
            Game.slow_puts("Go to Final Flan to save the world!")
            sleep (1)
        end
            
    end

    def self.bag_and_loc
        if self.bag.count == 5 && ICommand.player.location_id == 17
            self.end_game
        end
    end

    def self.end_game
        Game.slow_puts("\nCongratulations #{@@player.name.colorize(:red).bold}, you saved the world!")
        sleep(1)
        self.exit_game
    end

    def self.bag
        Action.class_variable_get(:@@bag)
    end

    def self.background_music
        # options = {
        #     :channels => [0,1],
        #     :latency => 1,
        #     :output_device => @@output
        # }
        # @playback = AudioPlayback.play("./SLOWER2019-01-02_-_8_Bit_Menu_-_David_Renda_-_FesliyanStudios.com.mp3", options)

        # @playback.block

        pid = fork{exec 'afplay', "app/SLOWER2019-01-02_-_8_Bit_Menu_-_David_Renda_-_FesliyanStudios.com.mp3"}
    end

end