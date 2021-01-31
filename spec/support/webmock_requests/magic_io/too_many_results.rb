# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.before(:each) do
    response_body = {
      "cards": [
        { name: 'Avacyn, Angel of Hope' },
        { name: 'Avacyn, Andgel of Doom' }
      ]
    }.to_json
    stub_request(:get, 'https://api.magicthegathering.io/v1/cards?name=Avacyn')
      .with(
        headers: {
          'Accept' => '*/*',
          'Host' => 'api.magicthegathering.io'
        }
      ).to_return(status: 200, body: response_body, headers: {})
  end
end
