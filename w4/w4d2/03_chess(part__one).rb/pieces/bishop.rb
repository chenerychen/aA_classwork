require_relative "pieces"
require_relative "module"



class Bishop < Piece

    include Slidable 
    
    protected 

    def move_dirs
        diagonal_dirs 
    end

end