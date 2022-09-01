class Deck < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cards
  # TODO: add randomise next card selection
end
