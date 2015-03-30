require 'spec_helper'

describe LeaflyApiWrapper::Mapper do
  describe '#new' do
    context 'with unsupported feed type' do
      it 'should rise error' do
        expect{ LeaflyApiWrapper::Mapper.new([], 'unsupported_feed') }
          .to raise_error
      end
    end

    context 'with valid feed type' do
      it 'should not rise error' do
        expect{ LeaflyApiWrapper::Mapper.new([], 'location_detail') }
          .not_to raise_error
      end

      it 'should set the mapper' do
        expect(LeaflyApiWrapper::Mapper.new([], 'location_detail').mapper).not_to be_nil
      end

      it 'should set the data' do
        expect(LeaflyApiWrapper::Mapper.new([], 'location_detail').data).not_to be_nil
      end
    end
  end

  describe '#mapping' do
    context 'for the location detail' do
      before do
        data = JSON.parse(File.read("spec/json_responses/single_location_result.json"))
        @mapper = LeaflyApiWrapper::Mapper.new(data, 'location_detail')
      end

      it 'should return simple values mapped like the id' do
        expect(@mapper.mapped['id']).to eq(1358)
      end

      it 'should return complex values mapped like the address' do
        expect(@mapper.mapped['address']).to eq('1 Broadway Suite A-150')
      end
    end

    context 'for the search result' do
      before do
        data = JSON.parse(File.read("spec/json_responses/locations_search_result.json"))
        @mapper = LeaflyApiWrapper::Mapper.new(data, 'location_search')
      end

      it 'should return simple values mapped like the id' do
        expect(@mapper.mapped['id']).to eq(92523)
      end

      it 'should return values that are not part of data empty like the website' do
        expect(@mapper.mapped['website']).to be_nil
      end
    end
  end
end
