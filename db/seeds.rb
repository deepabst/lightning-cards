print "Creating lightning cards..."

Card.destroy_all

c1 = Card.create!(
    front_text: 'Hello',
    back_text: 'Hola',
    front_img: '',
    back_img: '',
    category: 'spanish'
)

c2 = Card.create!(
    front_text: 'Good day',
    back_text: 'Guten Tag',
    front_img: '',
    back_img: '',
    category: 'german'
)

c3 = Card.create!(
    front_text: 'What is your name?',
    back_text: 'Wie heisst Du?',
    front_img: '',
    back_img: '',
    category: 'german'
)

puts "Done! Created #{Card.count} cards"

##############################

print "Creating decks...."

Deck.destroy_all

d1 = Deck.create! name: 'Spanish'
d2 = Deck.create! name: 'German'
d3 = Deck.create! name: 'JavaScript'

puts "Done! Created #{Deck.count} decks"
print Deck.pluck :name

################################
