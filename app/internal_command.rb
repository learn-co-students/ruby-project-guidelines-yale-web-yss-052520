require 'io/console'

class ICommand

    @@prompt = TTY::Prompt.new

    def self.player
        Game.class_variable_get(:@@player)
    end

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
            locations.find_by(id: self.player.location_id).north_location ? (self.player.location_id = locations.north_location) : (puts error_message)
        elsif direction == "south"
            locations.find_by(id: self.player.location_id).south_location ? (self.player.location_id = locations.south_location) : (puts error_message)
       # elsif direction == "east"
            #self.player.locations.east_location ? (self.player.location_id = self.player.locations.east_location) : (puts error_message)
        #elsif direction == "west"
            #self.player.locations.west_location ? (self.player.location_id = self.player.locations.west_location) : (puts error_message)
        end
    end

  # def self.location_display
       # north = Location.all.find_by(id: self.player.locations.north_location)
       # south = Location.all.find_by(id: self.player.locations.south_location)
        #east = Location.all.find_by(id: self.player.locations.east_location)
        #west = Location.all.find_by(id: self.player.locations.west_location)

       # puts "North of here, is #{north.name}." if north
       # puts "South of here, is #{south.name}." if south
        #puts "East of here, is #{east.name}." if east
        #puts "West of here, is #{west.name}." if west

   # end


end
