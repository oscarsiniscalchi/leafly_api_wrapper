require 'spec_helper'

describe LeaflyApiWrapper::Location do
  let(:jsons_dir) { './spec/json_responses' }

  context 'instantiated from a mapped search result' do
    before do
      raw_data = JSON.parse(File.read("#{jsons_dir}/locations_search_result.json"))
      data = LeaflyApiWrapper::Mapper.new(raw_data, 'location_search').mapped
      @location = LeaflyApiWrapper::Location.new(data)
    end

    it 'should be able to instantiate' do
      expect(@location).to be_a(LeaflyApiWrapper::Location)
    end

    %i{ id slug name address }.each do |attribute|
      it "should set the #{attribute}" do
        expect(@location.send(attribute)).not_to be_nil
      end
    end
  end

  context 'instantiated from a mapped location result' do
    before do
      raw_data = JSON.parse(File.read("#{jsons_dir}/single_location_result.json"))
      data = LeaflyApiWrapper::Mapper.new(raw_data, 'location_detail').mapped
      @location = LeaflyApiWrapper::Location.new(data)
    end

    it 'should be able to instantiate' do
      expect(@location).to be_a(LeaflyApiWrapper::Location)
    end

    %i{ id slug name address }.each do |attribute|
      it "should set the #{attribute}" do
        expect(@location.send(attribute)).not_to be_nil
      end
    end
  end
end
