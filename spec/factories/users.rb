# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'some@joe.com' }
    password { '123456' }
  end
end
