User.destroy_all 
Official.destroy_all
Email.destroy_all 
User.reset_pk_sequence
Official.reset_pk_sequence
Email.reset_pk_sequence

user1 = User.create(name: "Anmol", address: "address1", comment: "comment1")
user2 = User.create(name: "Larissa", address: "address2", comment: "comment2")

official1 = Official.create(name: "John", location: "Queens, NY", email: "email1@gmail.com", role: "State Rep")
official2 = Official.create(name: "Hannah", location: "Princeton, NJ", email: "email2@gmail.com", role: "Local Rep")

Email.create(message: "body", subject: "BLM", link: "link.com", user_id: user1.id, official_id: official1.id)
Email.create(message: "body2", subject: "Police brtality", link: "link2.com", user_id: user2.id, official_id: official2.id)

url = "https://www.googleapis.com/civicinfo/v2/representatives"
data = HTTParty.get(url)

binding.pry
0