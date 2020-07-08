# require_relative "pieces"
# require_relative "module"
require 'singleton'


class NullPiece < Piece

    include Singleton

    def initialize
        
    end

end