    def slug(dindin) # O(n^2) time 
        dindin ||= dindin = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
        big_fish = dindin[0]    
        
        dindin.each.with_index do |prey, i|
            counter = 0
            prey.each_char.each do |char|
                counter += 1
            end
            if big_fish.length < counter
                big_fish = dindin[i]
            end
        end
        return big_fish
    end

#p slug(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] )


    def dom(dindin, &prc)
        return dindin if dindin.length <= 1
        prc ||= Proc.new {|a,b| a <=> b}
        mid = dindin.length / 2
        left = dindin[0...mid].dom(dindin, &prc)
        right = dindin[mid..-1].dom(dindin, &prc)

        dindin.merge(left, right, &prc)
    end

    def merge(left, right, &prc)
        # prc ||= Proc.new {|a,b| a <=> b}
        sort = []

        while !left.empty? && !right.empty?
            if prc.call(left[0], right[0]) == 1
                sort << right.shift
            else
                sort << left.shift
            end
        end
        sort + left + right
    end
    p dom(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

    def lin(dindin)
        biggy = dindin[0]

        dindin.each do |yum|
            if yum.length > biggy
                biggy = yum
            end
        end
        return biggy
    end

    def octo_slow_dance(move, array)
        array.each.with_index do |jiggle, i|
            if move == jiggle
                return i
            end
        end
    
    end