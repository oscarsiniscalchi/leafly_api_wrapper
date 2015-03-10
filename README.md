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

### Configure

  ``` ruby
  # This could go on a rails initializer
  LeaflyApiWrapper.configure do |config|
    config.api_key = 'MY_API_KEY'
    config.api_id  = 'MY_API_ID'
  end
  ```

### Locations

The Location.near method allows you to search locations near a latitude and
longitude, it also allows you to send an additional parameter with options to
refine your search. Available options are:

 take               Number of results per page (MAX 50)
 page               The page of the results, 0 by default
 storefront		      Only return results with physical locations
 delivery		        Only return delivery services
 retail		          Only return retail locations (for CO & WA)
 medical		        Only return medical dispensaries
 creditcards		    Return locations that accept credit cards on site
 hasclones		      Only locations with clones available
 hasconcentrates		Only locations with concentrates on the menu
 hasedibles		      Only locations with edibles on the menu
 veterandiscount		Only locations that offer a discount for veterans

See more info at leafly api documentation at ( https://developer.leafly.com/docs )

  ```ruby
  response = LeaflyApiWrapper::Location.near(33.749, -117.874, take: 10)
  ```
Or you can get an specific result with Location.get method  

  ```ruby
  response = LeaflyApiWrapper::Location.get('dispensary-slug')
  ```

## Contributing

1. Fork it ( http://github.com/oscarsiniscalchi/leafly_api_wrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
