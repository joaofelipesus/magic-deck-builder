require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject { create(:deck) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:owner_id) }
end
