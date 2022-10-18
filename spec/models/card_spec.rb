require "rails_helper"

RSpec.describe Card, type: :model do

  # As a User, I want to create my own flash cards

  it "should create a card object" do
    test_user = User.create!(name: "Tiesto",
                             email: "tiesto@fake.com",
                             password: "chicken")
    test_deck = Deck.create! name: "RSpec Test Cards"
    test_user.decks << test_deck
    test_card = Card.create!(
      front_text: "Test card front text",
      back_text: "Test card back text",
      front_img: "",
      back_img: "",
      category: "rspec testing",
      deck_id: test_deck.id,
    )

    card_retrieved = Card.first
    p card_retrieved
    expect(card_retrieved).to_not be_nil
  end # create a card object
end # describe
