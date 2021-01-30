# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::Cards::MagicIo do
  describe '#parse' do
    let(:response) do
      {
        "cards": [
          {
            "name": 'Archangel Avacyn',
            "names": [
              'Archangel Avacyn',
              'Avacyn, the Purifier'
            ],
            "manaCost": '{3}{W}{W}',
            "cmc": 5,
            "colors": [
              'White'
            ],
            "colorIdentity": [
              'W'
            ],
            "type": 'Legendary Creature — Angel',
            "supertypes": [
              'Legendary'
            ],
            "types": [
              'Creature'
            ],
            "subtypes": [
              'Angel'
            ],
            "rarity": 'Mythic Rare',
            "set": 'SOI',
            "text": "Flash\nFlying, vigilance\nWhen Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.",
            "artist": 'James Ryman',
            "number": '5a',
            "power": '4',
            "toughness": '4',
            "layout": 'double-faced',
            "multiverseid": 409_741,
            "imageUrl": 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=409741&type=card',
            "rulings": [
              {
                "date": '2016-04-08',
                "text": 'Archangel Avacyn’s delayed triggered ability triggers at the beginning of the next upkeep regardless of whose turn it is.'
              },
              {
                "date": '2016-04-08',
                "text": 'Archangel Avacyn’s delayed triggered ability won’t cause it to transform back into Archangel Avacyn if it has already transformed into Avacyn, the Purifier, perhaps because several creatures died in one turn.'
              },
              {
                "date": '2016-04-08',
                "text": 'For more information on double-faced cards, see the Shadows over Innistrad mechanics article (http://magic.wizards.com/en/articles/archive/feature/shadows-over-innistrad-mechanics).'
              }
            ],
            "foreignNames": [
              {
                "name": '大天使艾维欣',
                "language": 'Chinese Simplified',
                "multiverseid": 410_071
              },
              {
                "name": '大天使艾維欣',
                "language": 'Chinese Traditional',
                "multiverseid": 410_401
              },
              {
                "name": 'Archange Avacyn',
                "language": 'French',
                "multiverseid": 411_061
              },
              {
                "name": 'Erzengel Avacyn',
                "language": 'German',
                "multiverseid": 410_731
              },
              {
                "name": 'Arcangelo Avacyn',
                "language": 'Italian',
                "multiverseid": 411_391
              },
              {
                "name": '大天使アヴァシン',
                "language": 'Japanese',
                "multiverseid": 411_721
              },
              {
                "name": '대천사 아바신',
                "language": 'Korean',
                "multiverseid": 412_051
              },
              {
                "name": 'Arcanjo Avacyn',
                "language": 'Portuguese (Brazil)',
                "multiverseid": 412_381
              },
              {
                "name": 'Архангел Авацина',
                "language": 'Russian',
                "multiverseid": 412_711
              },
              {
                "name": 'Arcángel Avacyn',
                "language": 'Spanish',
                "multiverseid": 413_041
              }
            ],
            "printings": [
              'SOI'
            ],
            "originalText": "Flash\nFlying, vigilance\nWhen Archangel Avacyn enters the battlefield, creatures you control gain indestructible until end of turn.\nWhen a non-Angel creature you control dies, transform Archangel Avacyn at the beginning of the next upkeep.",
            "originalType": 'Legendary Creature — Angel',
            "id": '02ea5ddc89d7847abc77a0fbcbf2bc74e6456559'
          }
        ]
      }
    end

    let(:card) { Parsers::Cards::MagicIo.parse(response) }
    it 'is expected to return a Card object' do
      expect(card).to be_a Card
    end
    it 'is expected to set correct attributes' do
      expect(card.name).to eq 'Archangel Avacyn'
      expect(card.external_id).to eq '02ea5ddc89d7847abc77a0fbcbf2bc74e6456559'
      expect(card.types).to eq ['Creature']
      expect(card.mana_cost).to eq '{3}{W}{W}'
      expect(card.power).to eq 4
      expect(card.toughness).to eq 4
      expect(card.colors).to eq ['White']
    end
  end
end
