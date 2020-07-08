require_relative "pieces"
require_relative "module"



class Queen < Piece

    include Slidable 

    protected 
    def move_dirs 
        horizontal_dirs + diagonal_dirs 
    end

end