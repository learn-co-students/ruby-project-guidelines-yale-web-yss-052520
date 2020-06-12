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
            Action.talk_to_npc
        when "l"
            self.look
        when "c"
            Action.check_bag
        when "p"
            Action.pickup
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
        puts "P -- Pickup Item"
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

    def self.move(direction)
        # possibly need return if checking bag
        error_message = "You've reached the edge of the map, turn back, or go a different direction!"

        if direction == "north"
            Location.find_by(id: self.player.location_id).north_location ? (self.player.location_id = Location.find_by(id: self.player.location_id).north_location) : (puts error_message)
            sleep(1)
        elsif direction == "south"
            Location.find_by(id: self.player.location_id).south_location ? (self.player.location_id = Location.find_by(id: self.player.location_id).south_location) : (puts error_message)
            sleep(1)
        elsif direction == "east"
            Location.find_by(id: self.player.location_id).east_location ? (self.player.location_id = Location.find_by(id: self.player.location_id).east_location) : (puts error_message)
            sleep(1)
        elsif direction == "west"
            Location.find_by(id: self.player.location_id).west_location ? (self.player.location_id = Location.find_by(id: self.player.location_id).west_location) : (puts error_message)
            sleep(1)
        end
    end

    def self.location_display
        north_row = Location.find_by(id: Location.find_by(id: self.player.location_id).north_location)
        south_row = Location.find_by(id: Location.find_by(id: self.player.location_id).south_location)
        east_row = Location.find_by(id: Location.find_by(id: self.player.location_id).east_location)
        west_row = Location.find_by(id: Location.find_by(id: self.player.location_id).west_location)

        puts "North of here, is #{north_row.name.colorize(:light_blue)}." if north_row
        puts "South of here, is #{south_row.name.colorize(:light_blue)}." if south_row
        puts "East of here, is #{east_row.name.colorize(:light_blue)}." if east_row
        puts "West of here, is #{west_row.name.colorize(:light_blue)}." if west_row
    end

    def self.move_and_display
        self.move_info
        self.location_display
        self.move(self.key_funcs)
        Game.clear_term
        Game.end_game_message
        Game.bag_and_loc
        sleep(0.5)
    end

    def self.move_and_display_loop
        self.move_and_display while (true)
    end

    def self.look
        lc1 = self.player.location_id
        lc2 = Item.find_by(location_id: lc1)&.location_id
        lc1 == lc2 ? (puts "\nI feel like something is here but I don't know where") : (puts "\nI feel like something is not here but I don't know")
        sleep(2)
    end

    def self.move_info
        puts <<-PARAGRAPH
Hi, #{self.player.name.colorize(:red).bold}! To move between locations, use the arrow keys 
on your keyboard. In each location, you'll run into another character,
to talk to them press 't'. If you want to search the location for any 
hidden gems, press 'l'. If you find a gem, and want to collect it use 
the 'p' key to pickup. If you're ever unsure of what you've picked up
you can always check your bag contents by pressing 'c'. Best of luck! \n\n
        PARAGRAPH
    end

end
