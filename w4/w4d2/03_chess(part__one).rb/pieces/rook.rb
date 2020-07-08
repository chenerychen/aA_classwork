require_relative "pieces"
require_relative "module"



class Rook < Piece

    include Slidable 

    def symbol_piece
         "R".colorize(color)  
    end 

  protected 

  def move_dirs
      horizontal_dirs 
  end 

end