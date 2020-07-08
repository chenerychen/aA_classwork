require "rspec"
require "first_tdd_projects.rb"

describe "Array#my_uniq" do 
    let(:input) { [1,2,3,4,4,4,3,2,6,7,7,8,8,9] }

    it "return an array with unique elements" do 
        expect(input.my_uniq.sort).to eq(input.uniq.sort)
    end

    it "return a new array" do 
        expect(input.object_id).to_not eq(input.my_uniq.object_id)   
    end 

    context "should take in an Array" do
        emp = []
        it "should return an empty array when the array is empty" do 
            expect(emp.my_uniq).to be_empty
        end 
    end
end

describe "Array#two_sum" do
    let(:array) { [3,2,-2,4,-4,5,6] }

    it "return the index of pairs that sum to 0" do 
        expect(array.two_sum).to eq([[1,2],[3,4]])
    end

end

describe "#my_transpose" do 
    let(:matrix) {[[0,1,2], [3,4,5], [6,7,8]]} 

    it "returns array with its columns and its rows swapped" do 
        expect(my_transpose(matrix)).to eq ([[0,3,6], [1,4,7], [2,5,8]])
    end 

    context "should take in a sqr matrix" do 
        it "height should be the same" do 
             input_height = matrix.length
             expect(input_height).to eq(my_transpose(matrix).length) 
        end 
        
        it "width should be the same" do
            input_width = matrix.map(&:length).max
            expect(input_width).to eq(my_transpose(matrix).map(&:length).max) 
        end  
    end 

end 

describe "#stock_picker" do 
    it "simple buy day and sell day" do 
        expect(stock_picker([1,2,3,4,5])).to eq([0,4])
    end

    it "pro buy day and sell day" do 
        expect(stock_picker([1,2,3,99,54,77,242424,33,4,5])).to eq([0,6])
    end

    it "cannot buy and sell on the same day" do 
        expect(stock_picker([999999999,1,3])).to eq([1,2])
    end
end

describe Towers do 
    subject(:toh) {Towers.new(3)}

    describe "#initialize" do 
        it "takes in n number of discs" do 
            expect(toh.n).to eq(3)
        end 
        
        it "create an array of discs" do
            expect(toh.discs).to eq([1,2,3])
        end 
    
        it "create a hash with ABC as keys and values are an array of disc(s)" do 
            expect(toh.board).to eq({A: [1,2,3], B: [], C: []})         
        end 
    end 

    describe "#move" do
        it "allow user to move one disc" do 
            allow(toh).to receive(:move).and_return({A: [2,3], B: [1], C: []})
        end
        
        it "raises error if bigger disc moves on top of smaller disk" do 
            expect { {A: [3], B: [2,1], C: []} }.to raise_error("Cannot move bigger disc onto smaller disk")
        end
    end

    describe "#won?" do 
        it "it is not won when you start the game" do 
            expect(toh).to be false
        end

        it "it is won when the discs are in ascending order and not in the original pile" do
            expect(toh.board).to eq({ A: [], B:[1,2,3], C:[] })
            expect(toh.board).to eq({ A: [], B:[], C:[1,2,3] })
        end
    end

end 