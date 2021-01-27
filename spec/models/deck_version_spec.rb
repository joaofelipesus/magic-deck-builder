require 'rails_helper'

RSpec.describe DeckVersion, type: :model do
  subject { create(:deck_version) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:deck) }
  it { should validate_uniqueness_of(:name).scoped_to(:deck_id) }
end
