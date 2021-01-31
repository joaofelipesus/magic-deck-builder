# frozen_string_literal: true

module Parsers
  module Cards
    class MagicIo
      def self.parse(params)
        Card.new(
          name: params[:name],
          external_id: params[:multiverseid],
          types: params[:types],
          mana_cost: params[:manaCost],
          power: params[:power],
          toughness: params[:toughness],
          colors: params[:colors]
        )
      end
    end
  end
end
