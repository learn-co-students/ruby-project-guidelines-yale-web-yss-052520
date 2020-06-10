require 'io/console'

class ICommand

    @@prompt = TTY::Prompt.new

    # http://www.alecjacobson.com/weblog/?p=75
    def self.read_char
        STDIN.echo = false
        STDIN.raw!
      
        input = STDIN.getc.chr
        if input == "\e" then
          input << STDIN.read_nonblock(3) rescue nil
          input << STDIN.read_nonblock(2) rescue nil
        end
      ensure
        STDIN.echo = true
        STDIN.cooked!
      
        return input
      end      

    def self.key_funcs
        c = self.read_char

        case c
        when "\e[A"
            move("north")
        when "\e[B"  
            move("south")    
        when "\e[C" 
            move("east") 
        when "\e[D"
            move("west")  
        when "h"
            Game.help_menu
        when "q"
            Game.exit_game
        when "t"
            talk_to_NPC 
        when "l"
            look #double check 
        when "c"
            check_bag
        when "1"
            Game.help_menu
        else 
            puts "That's not a command!"
        end
    end


    def self.display_key_funcs
        
        puts "Key Functions"
        puts "Up -- North"
        puts "Down -- South"
        puts "Left -- West"
        puts "Right -- East"
        puts "C -- Check Bag"
        puts "L -- Look Around"
        puts "T -- Talk to Guides"
        puts "H -- Help Menu"
        puts "Q -- Quit"

        puts "1 -- Back" #sketchy, but works
    end

    def self.use_and_display
        self.display_key_funcs
        self.key_funcs
    end

    def self.game_info
        Game.intro
        self.key_funcs
        #need back function
    end

    def move(direction)
        # possibly need return if checking bag

        error_message = "You've reached the edge of the map, turn back, or go a different direction!"

        if direction == "north"
            Player.locations.north_location ? (Player.location_id = Player.locations.north_location) : (puts error_message)
        elsif direction == "south"
            Player.locations.south_location ? (Player.location_id = Player.locations.south_location) : (puts error_message)
        elsif direction == "east"
            Player.locations.east_location ? (Player.location_id = Player.locations.east_location) : (puts error_message)
        elsif direction == "west"
            Player.locations.west_location ? (Player.location_id = Player.locations.west_location) : (puts error_message)
        end
    end

    def self.location_display
        north = Location.all.find_by(id: Player.locations.north_location)
        south = Location.all.find_by(id: Player.locations.south_location)
        east = Location.all.find_by(id: Player.locations.east_location)
        west = Location.all.find_by(id: Player.locations.west_location)

        puts "North of here, is #{north.name}"
        puts "South of here, is #{south.name}"
        puts "East of here, is #{east.name}"
        puts "West of here, is #{west.name}"

    end


end
