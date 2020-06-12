
class Action

    # move the item to the players bag, so when we check the bag we can see the items
    # each item will have a description
    # , 
    # plot: Our world is currently falling apart, and only you have the ability to save it
    # in order to protect the world, you must collect the five necessary gifts (from random locations) 
    # and bring them together to prevent 
    # this from happening. After collecting, you must bring them together and unite them at x location
    # Along the way, you will have various Nps to help you along your quest
    # potential time limit

    # npc to help indicate item
    # npc looks at location, see if assigned item and if true puts "might be something here, 'press p' to look"

    # bag count <= 5

    @@bag = []
    

    def self.pickup
        if ICommand.player.location_id == Item.find_by(location_id: ICommand.player.location_id)&.location_id
            @@bag << Item.find_by(location_id: ICommand.player.location_id)
            puts "You've picked up the item"
            puts "Please move on to the next location"
            sleep(1)
        else 
            puts "There's nothing for you to pickup"
            puts "Please move on to the next location"
            sleep(1)
        end
        Item.find_by(location_id: ICommand.player.location_id)&.update(location_id: nil)
        # # after you test code & pick up item, update item location_id to original in pry
        # binding.pry
    end

    # def self.change_item_id
    #     i = nil 
    # end
    
    def self.check_bag
        puts @@bag.map {|item| item.name}.uniq
        sleep(2)
        #return new array of all items in bag (name only)
    end

    def self.talk_to_npc
        if Location.find_by(npc_id:ICommand.player.location_id).npc_id == Item.find_by(location_id: ICommand.player.location_id)&.location_id
            # npc_id == item's location_id
            # check npc's location_id of the location of current player == 
            # if there is an item in your current location, that location_id = npc's location_id
            Game.slow_puts("#{Npc.find_by(id: Location.find_by(npc_id: ICommand.player.location_id).npc_id).name}: There seems to be an gem here, let me guide you")
            Game.slow_puts("#{Npc.find_by(id: Location.find_by(npc_id: ICommand.player.location_id).npc_id).name}: We found it! Press 'p' to pickup the gem.")
        else 
            Game.slow_puts("#{Npc.find_by(id: Location.find_by(npc_id: ICommand.player.location_id).npc_id).name}: There's nothing I can help you with. Move on to the next location.")
        end
        Game.clear_term
        #if yes = guide to location,pause, i think we found it, use 'p' to pickup the item, no = sorry I can't help
    end

end