# LeaflyApiWrapper

TODO: Write a gem description
A simple API wrapper for leafly.com API

## Installation

Add this line to your application's Gemfile:

    gem 'leafly_api_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install leafly_api_wrapper

## Usage

### Locations

  ``` ruby
  leafly = LeaflyApiWrapper.new()
  leafly.configure do |conf|
    conf.api_key = 'YOURAPIKEY'
    conf.api_ID  = 'YOURAPIID'
  end

  leafly.all_locations_near(lat: '-45.231', lon: '35.123')

  ```

## Contributing

1. Fork it ( http://github.com/oscarsiniscalchi/leafly_api_wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
