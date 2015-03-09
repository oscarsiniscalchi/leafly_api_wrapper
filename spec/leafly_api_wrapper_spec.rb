require 'spec_helper'

describe LeaflyApiWrapper do
  it 'should be configurable with a block' do
    LeaflyApiWrapper.configure do |config|
      config.api_key = 'test'
      config.api_id  = 'loto'
    end

    expect(LeaflyApiWrapper.configuration.api_key).to eq('test')
    expect(LeaflyApiWrapper.configuration.api_key).to eq('loto')
  end
end
