require 'rspec'
require './lib/leafly_api_wrapper'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
end
