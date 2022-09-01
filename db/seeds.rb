puts "Seeding the Lightning Cards database"

##############################

print "Creating decks...."

Deck.destroy_all

d1 = Deck.create! name: "Spanish"
d2 = Deck.create! name: "German"
d3 = Deck.create! name: "JavaScript"

puts "Done! Created #{Deck.count} decks"
print Deck.pluck :name

######################################
print "Creating cards..."

Card.destroy_all

c1 = Card.create!(
  front_text: "Hello",
  back_text: "Hola",
  front_img: "",
  back_img: "",
  category: "spanish",
  deck_id: d1.id,
)

c2 = Card.create!(
  front_text: "Good day",
  back_text: "Guten Tag",
  front_img: "",
  back_img: "",
  category: "german",
  deck_id: d2.id,
)

c3 = Card.create!(
  front_text: "What is your name?",
  back_text: "Wie heisst Du?",
  front_img: "",
  back_img: "",
  category: "german",
  deck_id: d2.id,
)

puts "Done! Created #{Card.count} cards"

# Test the associations
puts "Testing deck -< cards associations:"
puts " • the card with front: #{Card.first.front_text} and back: #{Card.first.back_text} is in Deck: '#{Card.first.deck.name}'"
puts " • the deck: '#{Deck.second.name}' contains the cards: #{Deck.second.cards.pluck(:front_text, :back_text).join(", ")}"

print "Creating users"

User.destroy_all

u1 = User.create! name: "Max", email: "max@fake.com", password: "chicken"
u2 = User.create! name: "Jane", email: "jane@fake.com", password: "chicken"
u3 = User.create! name: "Fiona", email: "fiona@fake.com", password: "chicken"

puts "Created #{User.count} users"

# add decks to users
u1.decks << d1
u2.decks << d2
u3.decks << d3

puts "User: #{u1.name} is studying decks #{u1.decks.pluck(:name).join(", ")}."
puts "Deck: #{d1.name} belongs to #{d1.user.name}"
puts "User: #{u2.name} is studying decks #{u2.decks.pluck(:name).join(", ")}."
puts "Deck: #{d2.name} belongs to #{d2.user.name}"
puts "User: #{u3.name} is studying decks #{u3.decks.pluck(:name).join(", ")}."
puts "Deck: #{d3.name} belongs to #{d3.user.name}"
