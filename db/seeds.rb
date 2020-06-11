Player.destroy_all
Player.reset_pk_sequence
Board.destroy_all
Board.reset_pk_sequence

alex = Player.create(name: "Alex")
bob = Player.create(name: "Bob")
cat = Player.create(name: "Cat")
dan = Player.create(name: "Dan")

config1 = [
    "⬜⬛⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜",
    "⬜⬛⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜",
    "⬜⬛⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜",
    "⬜⬛⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜"
]
config1 = config1.join("\n")
b1 = Board.create(r_player: alex, l_player: bob, content: config1)

config2 = [
    "⬜⬛⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜🔵⬜",
    "⬜🔴⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜🔵⬜",
    "⬜🔴⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜🔵⬜",
    "⬜🔴⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜"
]
config2 = config2.join("\n")

b2 = Board.create(r_player: bob, l_player: cat, content: config2)

config3  = [
    "⬜🔵⬜⬛⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜",
    "⬜⬛⬜⬛⬜🔴⬜⬛",
    "⬛⬜⬛⬜⬛⬜🔵⬜",
    "⬜⬛⬜⬛⬜⬛⬜⬛",
    "⬛⬜🔴⬜⬛⬜⬛⬜",
    "⬜⬛⬜🔵⬜⬛⬜⬛",
    "⬛⬜⬛⬜⬛⬜⬛⬜"
]
config3 = config3.join("\n")

b3 = Board.create(r_player: cat, l_player: alex, content: config3)

b4 = Board.create(r_player: alex, l_player: cat)

b3.load
b3.display
b3.update
# b3.display

binding.pry
0