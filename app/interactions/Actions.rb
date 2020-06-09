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
    @@bag = []

    def pickup
        #bag_contents
    end
    
    def check_bag
        @@bag
        #see what's inside
    end

    def look
        if #object is in this location, if object a location id that matches the current location id
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