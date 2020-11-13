class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack << el
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      return @stack[-1]
    end
  end

  class Queue 
    def initialize
        @array = []
    end

    def enqueue(ele)
        @array.unshift(ele) #add stuff
    end

    def dequeue(ele)
        @array.pop #remove last
    end

    def peek(ele)
        return @array[-1] #check out the last thing in the queue
    end
  end

  class Map

  end