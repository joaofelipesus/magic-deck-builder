# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.before(:each) do
    response_body = {
      "cards": [
        {
          "name": 'Shield of Kaldra',
          "names": [],
          "manaCost": '{4}',
          "cmc": 4.0,
          "colors": [],
          "colorIdentity": [],
          "type": 'Legendary Artifact — Equipment',
          "supertypes": [
            'Legendary'
          ],
          "types": [
            'Artifact'
          ],
          "subtypes": [
            'Equipment'
          ],
          "rarity": 'Rare',
          "set": 'DST',
          "setName": 'Darksteel',
          "text": "Equipment named Sword of Kaldra, Shield of Kaldra, and Helm of Kaldra have indestructible.\nEquipped creature has indestructible. (Damage and effects that say \"destroy\" don't destroy it.)\nEquip {4}",
          "artist": 'Donato Giancola',
          "number": '139',
          "layout": 'normal',
          "multiverseid": 48_582,
          "imageUrl": 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=48582&type=card',
          "rulings": [],
          "printings": %w[
            DST
            PPRE
            PRM
          ],
          "originalText": "Equipment named Sword of Kaldra, Shield of Kaldra, and Helm of Kaldra are indestructible.\nEquipped creature is indestructible. (\"Destroy\" effects and lethal damage don't destroy it.)\nEquip {4}",
          "originalType": 'Legendary Artifact - Equipment',
          "id": '73e4917c-e915-5451-93ad-ef34352bc59c'
        },
        {
          "name": 'Shield of Kaldra',
          "names": [],
          "manaCost": '{4}',
          "cmc": 4.0,
          "colors": [],
          "colorIdentity": [],
          "type": 'Legendary Artifact — Equipment',
          "supertypes": [
            'Legendary'
          ],
          "types": [
            'Artifact'
          ],
          "subtypes": [
            'Equipment'
          ],
          "rarity": 'Rare',
          "set": 'PPRE',
          "setName": 'Prerelease Events',
          "text": "Equipment named Sword of Kaldra, Shield of Kaldra, and Helm of Kaldra have indestructible.\nEquipped creature has indestructible. (Damage and effects that say \"destroy\" don't destroy it.)\nEquip {4}",
          "artist": 'Donato Giancola',
          "number": '22★',
          "layout": 'normal',
          "multiverseid": 97_055,
          "imageUrl": 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=97055&type=card',
          "watermark": 'set (DST)',
          "rulings": [],
          "foreignNames": [],
          "printings": %w[
            DST
            PPRE
            PRM
          ],
          "originalText": "Equipment named Sword of Kaldra, Shield of Kaldra, and Helm of Kaldra are indestructible.\nEquipped creature is indestructible. (\"Destroy\" effects and lethal damage don't destroy it.)\nEquip {4}",
          "originalType": 'Legendary Artifact - Equipment',
          "id": '46d73c48-44a7-5c87-8c16-e079ea88cb15'
        }
      ]
    }.to_json
    stub_request(:get, 'https://api.magicthegathering.io/v1/cards?name=Shield of Kaldra')
      .with(
        headers: {
          'Accept' => '*/*',
          'Host' => 'api.magicthegathering.io'
        }
      ).to_return(status: 200, body: response_body, headers: {})
  end
end
