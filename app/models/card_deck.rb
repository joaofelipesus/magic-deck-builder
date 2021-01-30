# frozen_string_literal: true

class CardDeck < ApplicationRecord
  belongs_to :card
  belongs_to :deck
  belongs_to :version_added, class_name: :DeckVersion
end
