require "leafly_api_wrapper/version"
require "leafly_api_wrapper/configuration"

module LeaflyApiWrapper
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
