# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::Cards::Finder do
  let(:card_name) { 'Shield of Kaldra' }
  subject { Services::Cards::Finder.new(card_name: card_name) }
  describe '#call' do
    context 'when card already exists' do
      before :each do
        create(:card, name: card_name)
      end
      it 'is expected to return it' do
        card = subject.call
        expect(card.name).to match card_name
      end
    end
    context 'when card wasnt found on database' do
      it 'is expected to create card on databse' do
        expect { subject.call }.to change { Card.count }.from(0).to(1)
      end
      it 'is expected to return card loaded' do
        card = subject.call
        expect(card.name).to match card_name
      end
    end
  end
end
