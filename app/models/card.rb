# frozen_string_literal: true

class Card < ApplicationRecord
  validates_presence_of :name, :external_id, :mana_cost
  validates_uniqueness_of :name, :external_id
end
