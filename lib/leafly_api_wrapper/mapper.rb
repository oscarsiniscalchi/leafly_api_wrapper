# This class helps to unify the key values of the feeds for location into
# a uniform hash that the Location initializer understands

module LeaflyApiWrapper
  class Mapper
    attr_accessor :mapper, :data

    def initialize(data, feed_type)
      path = File.expand_path("../feed_mapper/#{feed_type}_mapper.json", __FILE__)
      @mapper = JSON.parse(File.read(path))
      @data   = data
    end

    def mapped
      res = {}
      @mapper.each_pair do |k,v|
        if v.is_a? Array
          res[k] = v.map{ |cv| @data[cv] }.join(' ').strip
        elsif
          res[k] = @data[v]
        end
      end

      res
    end
  end
end
