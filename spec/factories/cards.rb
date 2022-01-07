# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    name { 'Akroma, Angel of Wrath' }
    external_id { '75703f17-9440-5c28-87e6-c2c7d41dbaa1' }
    types { ['Angel'] }
    mana_cost { '5{W}{W}{W}' }
    power { 6 }
    toughness { 6 }
    colors { ['white'] }
  end
end
