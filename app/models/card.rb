class Card < ApplicationRecord
  belongs_to :deck, optional: true

  validates :deck_id, presence: true
end
