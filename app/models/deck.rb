# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :owner, class_name: :User
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :owner_id
end
