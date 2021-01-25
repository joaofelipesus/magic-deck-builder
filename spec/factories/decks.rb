# frozen_string_literal: true

FactoryBot.define do
  factory :deck do
    name { 'Fractius' }
    owner { create(:user) }
    description { 'Some cool fractius deck :)' }
  end
end
