module LeaflyApiWrapper
  class Configuration
    attr_accessor :api_key, :api_id, :base_url

    def initialize
      @api_id  = 'API_ID'
      @api_key = 'API_KEY'
      @base_url = 'http://data.leafly.com/'
    end
  end
end
