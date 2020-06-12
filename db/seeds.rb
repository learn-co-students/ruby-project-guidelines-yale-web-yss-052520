Player.destroy_all
Player.reset_pk_sequence
Board.destroy_all
Board.reset_pk_sequence

alex = Player.create(name: "Alex", win_count: 999)
bob = Player.create(name: "Bob", win_count: 998)
cat = Player.create(name: "Cat", win_count: 50)
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

# b3.load
# test_piece = Piece.all.first
# test_piece.y_pos = 0
# b3.update
binding.pry
0