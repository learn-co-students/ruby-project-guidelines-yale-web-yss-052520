Player.destroy_all
Item.destroy_all

# Start Town 
l1 = Location.find_or_create_by(name: "Candy Castle",
    npc_id: 1,
    north_location: 16,
    south_location: 13,
    east_location: nil,
    west_location: 2
)

# Gummy Hills 
l2 = Location.find_or_create_by(name: "Gummy Hills",
    npc_id: 2,    
    north_location: 3,
    south_location: 9,
    east_location: 1,
    west_location: nil
)

# Cupcake Cosmos
l3 = Location.find_or_create_by(name: "Cupcake Cosmos",
    npc_id: 3,
    north_location: nil,
    south_location: 2,
    east_location: nil,
    west_location: 4
)

# Ice Cream Slopes 
l4 = Location.find_or_create_by(name: "Ice Cream Slopes",
    npc_id: 4,
    north_location: 5,
    south_location: 6,
    east_location: 3,
    west_location: nil
)

# Gingerbread House
l5 = Location.find_or_create_by(name: "Gingerbread House",
    npc_id: 5,
    north_location: nil,
    south_location: 4,
    east_location: nil,
    west_location: nil
)

# Licorice Lagoon
l6 = Location.find_or_create_by(name: "Licorice Lagoon",
    npc_id: 6,
    north_location: 4,
    south_location: 8,
    east_location: nil,
    west_location: 7
)

# Lollipop Woods
l7 = Location.find_or_create_by(name: "Lollipop Woods",
    npc_id: 7,
    north_location: nil,
    south_location: nil,
    east_location: 6,
    west_location: nil
)

# Ice Palace
l8 = Location.find_or_create_by(name: "Ice Palace",
    npc_id: 8,
    north_location: 6,
    south_location: nil,
    east_location: 9,
    west_location: nil
)

# Chocolate Mt
l9 = Location.find_or_create_by(name: "Chocolate Mt",
    npc_id: 9,
    north_location: 2,
    south_location: 10,
    east_location: nil,
    west_location: 8
)

# Sour Plateu
l10 = Location.find_or_create_by(name: "Sour Plateu",
    npc_id: 10,
    north_location: 9,
    south_location: nil,
    east_location: 11,
    west_location: nil
)

# CC Court
l11 = Location.find_or_create_by(name: "CC Court",
    npc_id: 11,    
    north_location: 13,
    south_location: 12,
    east_location: 15,
    west_location: 10
)

# Sprinkle Hills
l12 = Location.find_or_create_by(name: "Sprinkle Hills",
    npc_id: 12,
    north_location: 11,
    south_location: nil,
    east_location: nil,
    west_location: nil
)

# Brownie Way
l13 = Location.find_or_create_by(name: "Brownie Way",
    npc_id: 13,
    north_location: 1,
    south_location: 11,
    east_location: 14,
    west_location: nil
)

# Bluebery Block
l14 = Location.find_or_create_by(name: "Blueberry Block",
    npc_id: 14,
    north_location: 17,
    south_location: 15,
    east_location: nil,
    west_location: 13
)

# Mint Meadows
l15 = Location.find_or_create_by(name: "Mint Meadows",
    npc_id: 15,
    north_location: 14,
    south_location: nil,
    east_location: nil,
    west_location: 11
)

# Dessert Desert
l16 = Location.find_or_create_by(name: "Dessert Desert",
    npc_id: 17,
    north_location: nil,
    south_location: 1,
    east_location: 17,
    west_location: nil
)

# Final Flan
l17 = Location.find_or_create_by(name: "Final Flan",
    npc_id: 18,
    north_location: nil,
    south_location: 14,
    east_location: nil,
    west_location: 16
)

# Swizzle Stick
i1= Item.find_or_create_by(
    name: "Swizzle Stick",
    description: "A small stick that is used for more than just stirring drinks. It emits a magical glow.",
    location_id: 16,
    player_id: nil
)

# Chewy Nougat
i2= Item.find_or_create_by(
    name: "Chewy Nougat",
    description: "An aerated gem that is surrounded by a veil of fairy dust.",
    location_id: 9,
    player_id: nil
)

# Jolly Rancher
i3= Item.find_or_create_by(
    name: "Jolly Rancher",
    description: "A small but powerful gem, that packs a good punch.",
    location_id: 6,
    player_id: nil
)

# Taffy
i4= Item.find_or_create_by(
    name: "Taffy",
    description:"A gem that has the ability to control the sea.",
    location_id: 2,
    player_id: nil
)

# Lemonhead
i5= Item.find_or_create_by(
    name: "Lemonhead",
    description:"Sour, sweet, and all those before it will be gone.",
    location_id: 10,
    player_id: nil
)

#Chester Cheetah
npc1= Npc.find_or_create_by(
    name: "Chester Cheetah"
)

#Mr. Owl
npc2= Npc.find_or_create_by(
    name:"Mr. Owl"
)

#Mr. Green Giant
npc3= Npc.find_or_create_by(
    name:"Mr. Green Giant"
)

#Pillsbury Dough Boy
npc4= Npc.find_or_create_by(
    name:"Pillsbury Dough Boy"
)
#Mr. Gingerbread Man
npc5= Npc.find_or_create_by(
    name:"Mr. Gingerbread Man"
)

#Lord Licorice
npc6= Npc.find_or_create_by(
    name:"Lord Licorice"
)

#Mr. Quaker
npc7= Npc.find_or_create_by(
    name:"Mr. Quaker"
)

#Django
npc8= Npc.find_or_create_by(
    name:"Django"
   
)

#Princess Lolly
npc9= Npc.find_or_create_by(
    name: "Princess Lolly"
)

#King Kandy
npc10= Npc.find_or_create_by(
    name: "King Kandy"
)

#Gloppy
npc11= Npc.find_or_create_by(
    name: "Gloppy"
)

#Gramma Nutt
npc12= Npc.find_or_create_by(
    name: "Gramma Nutt"
)

#Betty Crocker
npc13= Npc.find_or_create_by(
    name: "Betty Crocker"
)

#Jolli
npc14= Npc.find_or_create_by(
    name: "Jolli"
)

#Plumpy
npc15= Npc.find_or_create_by(
    name: "Plumpy"
)

#Queen Frostine
npc16= Npc.find_or_create_by(
    name: "Queen Frostine"
)

#Mr. Mint
npc17= Npc.find_or_create_by(
    name: "Mr. Mint"
)