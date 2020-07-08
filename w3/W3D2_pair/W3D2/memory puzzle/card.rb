class Card

    ALPHA = ("A".."Z").to_a 

    attr_reader :value

    def self.shuffle_pairs(pair_nums)
        alpha = ALPHA
        if pair_nums > ALPHA.length 
            alpha *= 2
        end
        
        pairs = alpha.shuffle[0...pair_nums] * 2
        shuffled_pairs = pairs.shuffle!
        shuffled_pairs.map{|ele| Card.new(ele)}
    end 

    def initialize(value, revealed = false)
        @value = value 
        @revealed = revealed
    end 

    def hide
        @revealed = false  
    end  

    def reveal 
        @revealed = true 
    end

    def to_s
        if self.revealed?
            @card.to_s
        else
            ''
        end
    end

    def revealed?
        @revealed
    end

    def ==(card)
        self.value == card.value
    end

end 