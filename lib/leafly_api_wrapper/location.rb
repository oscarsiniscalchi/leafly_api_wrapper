require "leafly_api_wrapper/version"
require "faraday"
require "json"

module LeaflyApiWrapper
  class Location
    attr_reader :id, :slug, :name, :desription, :tagLine, :tagLineBlurb,
                :address, :city, :state, :zip,
                :phone, :hours, :website, :latitude, :longitude,
                :logo, :photos, :permalink, :specials,
                :atm, :creditCards, :veteranDiscount, :delivery,
                :retail, :medical, :storefront, :ada, :canadaLP,
                :facebookUrl, :twitterUrl, :googlePlusUrl,
                :pinterestUrl, :tumblrUrl, :instagramUrl

    def initialize(data)
      @id = data['id']
      @slug = data['slug']
      @name = data['name']
      @atm = data['atm']
      @creditCards = data['creditCards']
      @veteranDiscount = data['veteranDiscount']
      @ada = data['ada']
      @delivery = data['delivery']
      @retail = data['retail']
      @medical = data['medical']
      @storefront = data['storefront']
      @logo = data['logo']
      @address = data['address']
      @city = data['city']
      @state = data['state']
      @zip = data['zip']
      @phone = data['phone']
      @hours = data['hours']
      @website = data['website']
      @desription = data['desription']
      @latitude = data['latitude']
      @longitude = data['longitude']
      @photos = data['photos']
      @permalink = data['permalink']
      @canadaLP = data['canadaLP']
      @tagLine = data['tagLine']
      @tagLineBlurb = data['tagLineBlurb']
      @facebookUrl = data['facebookUrl']
      @twitterUrl = data['twitterUrl']
      @googlePlusUrl = data['googlePlusUrl']
      @pinterestUrl = data['pinterestUrl']
      @tumblrUrl = data['tumblrUrl']
      @instagramUrl = data['instagramUrl']
      @specials = data['specials']
    end

    def self.near(lat, lon, options = {})
      response = connection.post '/locations', {
        page:      0,
        take:      50,
        latitude:  lat,
        longitude: lon
      }.merge(options)

      JSON.parse(response.body)['stores'].collect do |raw_data|
        data = LeaflyApiWrapper::Mapper.new(raw_data, 'location_search').mapped
        new(data)
      end
    end

    def self.get(slug)
      res = connection.get "/locations/#{slug}"
      raw_data = JSON.parse(res.body)
      data = LeaflyApiWrapper::Mapper.new(raw_data, 'location_detail').mapped
      new(data)
    end

    private

    def self.connection
      api_id   = LeaflyApiWrapper.configuration.api_id
      api_key  = LeaflyApiWrapper.configuration.api_key
      base_url = LeaflyApiWrapper.configuration.base_url

      conn = Faraday.new(url: base_url) do |req|
        req.headers = { 'app_key' => api_key, 'app_id' => api_id }
        req.request  :url_encoded
        req.response :logger
        req.adapter  Faraday.default_adapter
      end
    end
  end
end
