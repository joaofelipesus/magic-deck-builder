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
        if card_name.nil?
          puts 'load_card'
          puts 'persist card'
          card = nil
        end
        card
      end
    end
  end
end