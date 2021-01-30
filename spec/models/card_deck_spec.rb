# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardDeck, type: :model do
  it { should belong_to(:card) }
  it { should belong_to(:deck) }
  it { should belong_to(:version_added) }
end
