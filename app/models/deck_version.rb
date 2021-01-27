# frozen_string_literal: true

class DeckVersion < ApplicationRecord
  belongs_to :deck
  validates_presence_of :name, :deck
  validates_uniqueness_of :name, scope: :deck_id
end
