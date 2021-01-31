# frozen_string_literal: true

module Services
  module Cards
    class Finder
      attr_reader :card_name

      def initialize(card_name:)
        @card_name = card_name
      end

      def call
        card = Card.find_by(name: card_name)
        card = load_card if card.nil?
        card
      end

      private

      def load_card
        card = Loaders::MagicIo::Card.new(card_name: card_name).load
        card.save
        card
      end
    end
  end
end
