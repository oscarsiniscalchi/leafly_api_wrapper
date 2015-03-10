require 'rspec'
require './lib/leafly_api_wrapper'
require 'vcr'
require 'webmock'
require 'byebug'

VCR.configure do |c|
  c.cassette_library_dir = './spec/vcr_cassettes'
  c.hook_into :webmock
end
