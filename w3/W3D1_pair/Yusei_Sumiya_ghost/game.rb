require_relative "./player.rb"

class Game
    attr_accessor :fragment
    attr_reader :player_1, :player_2, :dictionary, :current_player, :previous_player
    

    def initialize
        puts "Player 1, enter your name:"
        @player_1 = Player.new
        puts "Player 2, enter your name:"
        @player_2 = Player.new
        @current_player = @player_1
        @fragment = ""
    end

    def get_dict
        @dictionary = {}
        File.foreach("dictionary.txt") do |word|
            @dictionary[word.chomp] = 0
        end
    end

    def switch_player!
        if @current_player.name == @player_1.name
            @current_player = @player_2 ; @previous_player = @player_1
        else
            @current_player = @player_1 ; @previous_player = @player_2
        end
    end

    def take_turn
        puts "It is #{@current_player.name}'s turn, and the fragment is . Please enter a letter:"
        guess = gets.chomp
        if self.valid_play?(guess)
            fragment += guess.downcase
        else
            puts "Invalid guess, you've forfeited your turn"
            self.switch_player!
        end


    # def add_player(name)
    #     @players << Player.new(name)
    # end




end