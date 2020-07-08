

class Piece 
        attr_reader :pos, :board, :color

    def initialize#(color, board, pos) 
        @color = color
        @board = board
        @pos = pos
    end 
    
    def moves #valid_moves(uml)?
       
    end 


end 
#   MOVES = [
#         [-2, -1],
#         [-2, 1],
#         [-1, 2],
#         [-1, -2],
#         [2, -1],
#         [2, 1],
#         [1, -2],
#         [1, 2]
#     ]

# def self.valid_moves(pos) #[5,5] if x or y is over 7 dont include
#         possible_moves = []
        
#         MOVES.each do |move|
#            if (move[0] + pos[0] <= 7 && move[1] + pos[1] <= 7) &&     
#                 (move[0] + pos[0] >= 0 && move[1] + pos[1] >= 0)
#                 possible_moves << move 
#            end 
#         end 

