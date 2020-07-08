class Array

    # my_flatten
    def my_flatten
        new_arr = []
        self.each do |el|
            if el.is_a?(Array)
                new_arr += el.my_flatten
            else
                new_arr += [el]
            end
        end
        new_arr
    end


    # my_zip
    def my_zip(*args)
        args = args.unshift(self)
        len = args.length
        new_array = Array.new(self.length) { Array.new(len) }

        (0...self.length).each do |i|
            (0...len).each do |j|
                new_array[i][j] = args[j][i]
            end 
        end 
        new_array
    end


    # my_rotate
    def my_rotate(num=1)
        if num > 0
            num.times do
                first_ele = self.shift
                self.push(first_ele)
            end
        else
            num.abs.times do
                last_ele = self.pop
                self.unshift(last_ele)
            end
        end
        self
    end


    # my_join
    def my_join(sep="")
        new_str = ''
        self.each do |el| 
            new_str += el.to_s + sep
        end 
        new_str[-1] == sep ? new_str[0...-1] : new_str
    end

    # my_reverse
    def my_reverse
        return self if self.length == 1
        [self[-1]] + self[0...-1].my_reverse
    end

end

