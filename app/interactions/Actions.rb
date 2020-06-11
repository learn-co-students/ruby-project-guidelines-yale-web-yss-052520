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

    # look for item: 
    # look at location, see if it's assigned an item id and if true puts "there might be something here", else puts "not here"

    # npc to help indicate item
    # npc looks at location, see if assigned item and if true puts "might be something here, 'press p' to look"

    # pickup for item:
    # Items.player_id = self.player.id
    # bag count += 1

    # bag count <= 5

    @@bag = []

    def pickup
        #bag_contents
    end
    
    def self.check_bag
        @@bag.map {|item| item.name}
        #return new array of all items in bag (name only)
    end

    def self.look
        if ICommand.player.location_id = Item.find_by(location_id: ICommand.player.location_id)
            #object is in this location, if object a location id that matches the current location id
            puts "I feel like something is here but I don't know where"
        else #object is not in this location, if objects location id doesnt match the location's id
            puts "I feel like something is not here but I don't know"
        end
        #to look around the area
    end

    def talk_to_NPC
        #talk to NPC
    end

end