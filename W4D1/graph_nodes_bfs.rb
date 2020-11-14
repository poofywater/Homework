require "set"

class GraphNode

    attr_accessor :val, :neighbors
    def initialize(val)
        @val = val
        @neighbors = []
    end

    def bfs(starting_node, target_value)
        queue = []
        queue << self
        visited = Set.new() 

        while !queue.empty?
            result = queue.shift
            visited.add(result)
            return result if result.val == target_value

            result.neighbors.each do |sir|
                queue << sir if !visited.include?(sir)
            end
        end
        nil
    end
    
end
a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p a.bfs(a, "b")
p a.bfs(a, "f")

