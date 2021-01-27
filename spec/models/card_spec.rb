# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:external_id) }
  it { should validate_presence_of(:mana_cost) }
  it { should validate_presence_of(:colors) }
  it { should validate_uniqueness_of(:external_id) }
  it { should validate_uniqueness_of(:name) }
end
