# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Loaders::MagicIo::Card do
  describe '#load' do
    before(:each) { @loader = Loaders::MagicIo::Card.new(card_name: card_name) }
    context 'when card is not found' do
      let(:card_name) { 'Avacyn, Angel of Doom' }
      it 'is expected to raise error Loaders::MagicIo::Errors::CardNotFound' do
        expect do
          @loader.load
        end.to raise_error(Loaders::MagicIo::Errors::CardNotFound)
      end
    end
    context 'when name is too generic' do
      let(:card_name) { 'Avacyn' }
      it 'is expected to raise error Loaders::MagicIo::Errors::TooManyResults' do
        expect do
          @loader.load
        end.to raise_error(Loaders::MagicIo::Errors::TooManyResults)
      end
    end
    context 'when card is found' do
      let(:card_name) { 'Shield of Kaldra' }
      before(:each) { @card = @loader.load }
      it 'is expected to return a Card object' do
        expect(@card).to be_a Card
      end
    end
  end
end
