class Array

    # my_each
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    # my_select
    def my_select(&prc)
        self.reverse.my_each do |el|
           self.delete(el) if !prc.call(el)
        end.reverse
        self
    end


    # my_reject
    def my_reject(&prc)
        self.reverse.my_each do |el|
            self.delete(el) if prc.call(el)
         end.reverse
         self
    end


    # my_any
    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end
        false
    end

    def my_all?(&prc)
        count = 0 
        self.my_each do |el| 
            count += 1 if prc.call(el) 
        end  
        count == self.length 
    end


end