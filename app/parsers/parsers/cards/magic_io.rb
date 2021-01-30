# frozen_string_literal: true

module Parsers
  module Cards
    class MagicIo
      def self.parse(params)
        # card_params = HashWithIndifferentAccess.new(params['cards'])
        # p params[:cards].first
        # p params
        # p card_params
        card_params = params[:cards].first
        Card.new(
          name: card_params[:name],
          external_id: card_params[:id],
          types: card_params[:types],
          mana_cost: card_params[:manaCost],
          power: card_params[:power],
          toughness: card_params[:toughness],
          colors: card_params[:colors]
        )
      end
    end
  end
end
