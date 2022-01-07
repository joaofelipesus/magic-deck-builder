# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::Cards::MagicIo do
  describe '#parse' do
    let(:response) do
      {
        name: 'Archangel Avacyn',
        names: [
          'Archangel Avacyn',
          'Avacyn, the Purifier'
        ],
        manaCost: '{3}{W}{W}',
        cmc: 5,
        colors: [
          'White'
        ],
        colorIdentity: [
          'W'
        ],
        type: 'Legendary Creature — Angel',
        supertypes: [
          'Legendary'
        ],
        types: [
          'Creature'
        ],
        subtypes: [
          'Angel'
        ],
        rarity: 'Mythic Rare',
        set: 'SOI',
        text: "Flash\nFlying, vigilance\nWhen Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.",
        artist: 'James Ryman',
        number: '5a',
        power: '4',
        toughness: '4',
        layout: 'double-faced',
        multiverseid: 409_741,
        imageUrl: 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card',
        printings: [
          'SOI'
        ],
        originalText: "Flash\nFlying, vigilance\nWhen Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.",
        originalType: 'Legendary Creature — Angel',
        id: '02ea5ddc89d7847abc77a0fbcbf2bc74e6456559'
      }
    end

    let(:card) { Parsers::Cards::MagicIo.parse(response) }
    it 'is expected to return a Card object' do
      expect(card).to be_a Card
    end
    it 'is expected to set correct attributes' do
      expect(card.name).to eq 'Archangel Avacyn'
      expect(card.external_id).to eq '409741'
      expect(card.types).to eq ['Creature']
      expect(card.mana_cost).to eq '{3}{W}{W}'
      expect(card.power).to eq 4
      expect(card.toughness).to eq 4
      expect(card.colors).to eq ['White']
    end
  end
end
