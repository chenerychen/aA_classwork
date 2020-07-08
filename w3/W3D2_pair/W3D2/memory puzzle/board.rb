require_relative "card"
require 'byebug'


class Board

    attr_reader :grid, :size

    def initialize(num)
        @grid = Array.new(num) {Array.new(num)}  
        @size = num * num 
    end 
    
    def populate  
        pair_nums = @size / 2 
        pairs_arr = Card.shuffle_pairs(pair_nums)
        # debugger
        @grid.each.with_index do |row,i|
            row.each.with_index do |el, j| 
                @grid[i][j] = pairs_arr.shift
            end 
        end 
        @grid
    end 

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def render
        @grid.each do |row|
            row.each do |ele|
                # debugger
                if ele.revealed?
                    print ele.value
                else 
                    print '_'
                end
            end
            puts
        end
    end
    
    def empty?
        @grid.any?{|row| row.any?{|ele| ele.value == '_'}}
    end

    def won?
        unless self.empty?
            p 'you won'
            return true
        end
    end

    def reveal(guessed_pos) 
        if @grid[guessed_pos].reveal  
            return @grid[guessed_pos].value
        else
            @grid[guessed_pos].reveal = true
        end 
    end 





end 

a = Board.new(4)
a.populate
a.render