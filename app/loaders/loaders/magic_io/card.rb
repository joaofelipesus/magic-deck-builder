# frozen_string_literal: true

module Loaders
  module MagicIo
    class Card < Loaders::MagicIo::Base
      attr_reader :card_name, :response

      def initialize(card_name:)
        super()
        @card_name = card_name
      end

      def load
        RestClient.get("#{URL}/cards?name=#{card_name}") do |response, _request, _result|
          @response = response
          raise Loaders::MagicIo::Errors::CardNotFound if valid_cards.empty?
          raise Loaders::MagicIo::Errors::TooManyResults unless single_card_returned?

          Parsers::Cards::MagicIo.parse(valid_cards.first)
        end
      end

      private

      def cards_found
        body = JSON.parse(response.body).deep_symbolize_keys
        body[:cards].sort_by { |card| card[:name] }
      end

      def single_card_returned?
        first_card_name = valid_cards.first[:name]
        valid_cards.all? { |card| card[:name] == first_card_name }
      end

      def valid_cards
        cards_with_multiverse_id = cards_found.select do |card|
          card[:multiverseid].nil? == false
        end
        cards_with_multiverse_id.select do |card|
          card[:name].include?('Avatar') == false
        end
      end
    end
  end
end
