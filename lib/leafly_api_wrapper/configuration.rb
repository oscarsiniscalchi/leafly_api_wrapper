module LeaflyApiWrapper
  class Configuration
    attr_accessor :api_key, :api_id

    def initialize
      @api_id  = 'API_ID'
      @api_key = 'API_KEY'
    end
  end
end
