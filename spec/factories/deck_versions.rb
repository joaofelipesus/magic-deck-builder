# frozen_string_literal: true

FactoryBot.define do
  factory :deck_version do
    name { 'v1.0' }
    description { 'Changed land pool' }
    deck
  end
end
