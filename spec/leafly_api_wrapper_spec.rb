require 'spec_helper'

describe LeaflyApiWrapper do
  before do
    LeaflyApiWrapper.configure do |config|
      config.api_id  = 'LEAFLY_API_ID'
      config.api_key = 'LEAFLY_API_KEY'
    end
  end

  it 'should be configurable with a block' do
    expect(LeaflyApiWrapper.configuration.api_key).to eq('LEAFLY_API_KEY')
    expect(LeaflyApiWrapper.configuration.api_id).to eq('LEAFLY_API_ID')
  end

  it 'should set the default base url to the config' do
    expect(LeaflyApiWrapper.configuration.base_url).to eq('http://data.leafly.com/')
  end

  it 'should get 10 places near' do
    VCR.use_cassette('locations_near_point') do
      res = LeaflyApiWrapper::Location.near(33.749, -117.874, take: 10)
      expect(res.count).to eq(11)
    end
  end

  it 'should set the address' do
    VCR.use_cassette('locations_near_point') do
      res = LeaflyApiWrapper::Location.near(33.749, -117.874, take: 10)
      expect(res.first.address).to eq('Lake Forest,CA')
    end
  end

  it 'should get location details' do
    VCR.use_cassette('locations_detail') do
      location = LeaflyApiWrapper::Location.get('denver-relief')

      expect(location).to be_a(LeaflyApiWrapper::Location)
      expect(location.name).to eq('Denver Relief')
      expect(location.slug).to eq('denver-relief')
      expect(location.address).to eq('1 Broadway Suite A-150')
    end
  end
end
