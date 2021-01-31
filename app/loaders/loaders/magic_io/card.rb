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
          raise Loaders::MagicIo::Errors::CardNotFound if cards_found.empty?
          raise Loaders::MagicIo::Errors::TooManyResults unless single_card_returned?

          Parsers::Cards::MagicIo.parse(cards_found.first)
        end
      end

      private

      def cards_found
        body = JSON.parse(response.body).deep_symbolize_keys
        body[:cards]
      end

      def single_card_returned?
        first_card_name = cards_found.first[:name]
        cards_found.all? { |card| card[:name] == first_card_name }
      end
    end
  end
end
