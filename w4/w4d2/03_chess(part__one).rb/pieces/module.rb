require_relative "./board"


module Slidable 
    private

    HORIZONTAL_DIRS = [
        [0,1],
        [0,-1],
        [1,0],
        [-1,0]
    ]

    DIAGONAL_DIRS = [
        [1,1],
        [-1,1],
        [1,-1],
        [-1,-1]
    ]

    public 

    def horizontal_dirs
        return HORIZONTAL_DIRS
    end 

    def diagonal_dirs
        return DIAGONAL_DIRS
    end 

    def moves 
        possible_positions = []
        
        move_dirs.each do |dir| 
             dx, dy = dir 
             possible_positions += grow_unblocked_moves_in_dirs(dx, dy) 
        end 
        possible_positions
    end 

    #  def self.valid_moves(pos) #[5,5] if x or y is over 7 dont include
    #     possible_moves = []
        
    #     MOVES.each do |move|
    #        if (move[0] + pos[0] <= 7 && move[1] + pos[1] <= 7) &&     
    #             (move[0] + pos[0] >= 0 && move[1] + pos[1] >= 0)
    #             possible_moves << move 
    #        end 
    #     end 

    protected

    def move_dirs
        return horizontal_dirs + diagonal_dirs 
    end 

    def grow_unblocked_moves_in_dirs(dx, dy)
        #loop that increments 
        possible_positions = []
        new_position = [self.pos[0] + dx, self.pos[1] + dy] 

        until !self.board.valid_pos?(new_position) || self.board[new_position].color == self.color || self.board[possible_positions[-1]].color != self.color  
            possible_positions << new_position
            new_position = [new_position[0] + dx, new_position[1] + dy] 
        end 

        possible_positions
    end 


    
    #where do we get positions?
    
    # horizontal_dirs - method that returns the corresponding constant
    
    
    # diagonal_dirs - method that returns the corresponding constant
    
    # moves - all the possibles positions that a piece can move to
    #  will call grow_unblocked_moves_in_dirs
    # grow_unblocked_moves_in_dirs(dx, dy) - for a given direction, 
        # returns an array of all the possible positions for a given direction
    
    
end 


module Stepable 


end 

