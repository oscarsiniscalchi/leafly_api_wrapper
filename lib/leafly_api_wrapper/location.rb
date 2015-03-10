require "leafly_api_wrapper/version"
require "faraday"
require "json"

module LeaflyApiWrapper
  class Location
    attr_reader :id, :name, :slug, :hours, :phone, :address, :locationLabel,
      :delivery, :storefront, :lastMenuUpdate, :latitude, :longitude, :rating,
      :numReviews, :sponsor, :ada, :creditCards, :atm, :marquee, :coverPhoto,
      :logoId, :logo, :medical, :retail, :price1, :price2, :price3,
      :mapMarkerLevel, :canadaLP, :tagLine, :permalink, :starImage,
      :customMarker, :customMarker2x, :mapMarker, :specials

    def initialize(data)
      @id = data['id']
      @name    = data['name']
      @slug    = data['slug']
      @address = "#{data['address1']} #{data['address2']}"
      @hours = data['hours']
      @phone = data['phone']
      @locationLabel = data['locationLabel']
      @delivery = data['delivery']
      @storefront = data['storefront']
      @lastMenuUpdate = data['lastMenuUpdate']
      @latitude = data['latitude']
      @longitude = data['longitude']
      @rating = data['rating']
      @numReviews = data['numReviews']
      @sponsor = data['sponsor']
      @ada = data['ada']
      @creditCards = data['creditCards']
      @atm = data['atm']
      @marquee = data['marquee']
      @coverPhoto = data['coverPhoto']
      @logoId = data['logoId']
      @logo = data['logo']
      @medical = data['medical']
      @retail = data['retail']
      @price1 = data['price1']
      @price2 = data['price2']
      @price3 = data['price3']
      @mapMarkerLevel = data['mapMarkerLevel']
      @canadaLP = data['canadaLP']
      @tagLine = data['tagLine']
      @permalink = data['permalink']
      @starImage = data['starImage']
      @customMarker = data['customMarker']
      @customMarker2x = data['customMarker2x']
      @mapMarker = data['mapMarker']
      @specials = data['specials']
    end


    def self.near(lat, lon, options = {})
      response = connection.post '/locations', {
        page:      0,
        take:      50,
        latitude:  lat,
        longitude: lon
      }.merge(options)

      JSON.parse(response.body)['stores'].collect do |data|
        new(data)
      end
    end

    def self.get(slug)
      res = connection.get "/locations/#{slug}"
      new(JSON.parse(res.body))
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
