Player.destroy_all

p1 = Player.create(name: "D", bag_count: 0, location_id: 1)

# Start Town 
l1 = Location.find_or_create_by(name: "Candy Castle",
    npc_id: nil,
    north_location: 16,
    south_location: 13,
    east_location: nil,
    west_location: 2
)

# Gummy Hills 
l2 = Location.find_or_create_by(name: "Gummy Hills",
    npc_id: nil,    
    north_location: 3,
    south_location: 9,
    east_location: 1,
    west_location: nil
)

# Cupcake Cosmos
l3 = Location.find_or_create_by(name: "Cupcake Cosmos",
    npc_id: nil,
    north_location: nil,
    south_location: 2,
    east_location: nil,
    west_location: 4
)

# Ice Cream Slopes 
l4 = Location.find_or_create_by(name: "Ice Cream Slopes",
    npc_id: nil,
    north_location: 5,
    south_location: 6,
    east_location: 3,
    west_location: nil
)

# Gingerbread House
l5 = Location.find_or_create_by(name: "Gingerbread House",
    npc_id: nil,
    north_location: nil,
    south_location: 4,
    east_location: nil,
    west_location: nil
)

# Licorice Lagoon
l6 = Location.find_or_create_by(name: "Licorice Lagoon",
    npc_id: nil,
    north_location: 4,
    south_location: 8,
    east_location: nil,
    west_location: 7
)

# Lollipop Woods
l7 = Location.find_or_create_by(name: "Lollipop Woods",
    npc_id: nil,
    north_location: nil,
    south_location: nil,
    east_location: 6,
    west_location: nil
)

# Ice Palace
l8 = Location.find_or_create_by(name: "Ice Palace",
    npc_id: nil,
    north_location: 6,
    south_location: nil,
    east_location: 9,
    west_location: nil
)

# Chocolate Mt
l9 = Location.find_or_create_by(name: "Chocolate Mt",
    npc_id: nil,
    north_location: 2,
    south_location: 10,
    east_location: nil,
    west_location: 8
)

# Sour Plateu
l10 = Location.find_or_create_by(name: "Sour Plateu",
    npc_id: nil,
    north_location: 9,
    south_location: nil,
    east_location: 11,
    west_location: nil
)

# CC Court
l11 = Location.find_or_create_by(name: "CC Court",
    npc_id: nil,    
    north_location: 13,
    south_location: 12,
    east_location: 15,
    west_location: 10
)

# Sprinkle Hills
l12 = Location.find_or_create_by(name: "Sprinkle Hills",
    npc_id: nil,
    north_location: 11,
    south_location: nil,
    east_location: nil,
    west_location: nil
)

# Brownie Way
l13 = Location.find_or_create_by(name: "Brownie Way",
    npc_id: nil,
    north_location: 1,
    south_location: 11,
    east_location: 14,
    west_location: nil
)

# Bluebery Block
l14 = Location.find_or_create_by(name: "Blueberry Block",
    npc_id: nil,
    north_location: 17,
    south_location: 15,
    east_location: nil,
    west_location: 13
)

# Mint Meadows
l15 = Location.find_or_create_by(name: "Mint Meadows",
    npc_id: nil,
    north_location: 14,
    south_location: nil,
    east_location: nil,
    west_location: 11
)

# Dessert Desert
l16 = Location.find_or_create_by(name: "Dessert Desert",
    npc_id: nil,
    north_location: nil,
    south_location: 1,
    east_location: 17,
    west_location: nil
)

# Final Flan
l17 = Location.find_or_create_by(name: "Final Flan",
    npc_id: nil,
    north_location: nil,
    south_location: 14,
    east_location: nil,
    west_location: 16
)
