require_relative "pieces/pieces.rb"
require_relative "pieces/rook.rb"
require_relative "pieces/null_piece.rb"


class NoPieceError < StandardError
    def message
        return "there is no piece at start_pos"
    end 
end 

class EndPosError < StandardError
    def message
        return "the piece cannot move to end_pos"
    end 
end 


class Board 
    
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @grid.each_with_index do |row,i| 
            row.each.with_index do |col,j|
                if i == 0 || i == 1 || i == 6 || i == 7 
                    @grid[i][j] = Rook.new(white, self, [i,j])
                else  
                    @grid[i][j] = NullPiece.instance
                end 
            end 
        end 
    end 

    def [](pos)
        row, col = pos
        @grid[row][col]
    end 

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end 
    
    def move_piece(start_pos, end_pos) 
        if !self[start_pos].nil? && valid_pos?(end_pos)
            self[end_pos] = self[start_pos] 
            self[start_pos] = nil
        elsif self[start_pos].nil? && valid_pos?(end_pos)
            raise NoPieceError 
        elsif !self[start_pos].nil? && !valid_pos?(end_pos)
            raise EndPosError
        else  
            raise "Both Wrong!"
        end
    end 

    def valid_pos?(pos)
        return true if end_pos[0].between?(0,7) && end_pos[1].between?(0,7)
        false 
    end 

end 