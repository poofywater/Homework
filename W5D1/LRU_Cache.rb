class LRUCache

    attr_reader :num
    def initialize(num)
        @cache = []      
        @size = num
    end

    def count
        return @cache.length
    end

    def add(el)
        if !@cache.include?(el)
        @cache << el
        elsif 
            @cache.count >= @size
            @cache.shift
            @cache << el
        end
    end

    def show
        @cache
    end

    private
end
johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

 p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show