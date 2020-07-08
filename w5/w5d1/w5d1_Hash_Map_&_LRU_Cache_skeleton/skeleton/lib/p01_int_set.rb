require "set"

class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # raise 'Out of bounds' if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    # raise 'Out of bounds' if num >= @store.length || num < 0
    @store.delete_at(num)
  end

  def include?(num)
    # raise 'Out of bounds' if num >= @store.length || num < 0
    @store[num] == true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end


class MaxIntSet < IntSet
  attr_reader :max 
  def initialize(max)
      @max = max
      super(max)
  end

  def insert(num)
    raise 'Out of bounds' if num >= max || num < 0
      @store[num] = true
      # p @store
  end

  def remove(num)
      raise 'Out of bounds' if num >= max || num < 0
      @store.delete_at(num)
      # @store[num] = false
  end

  def include?(num)
      raise 'Out of bounds' if num >= max || num < 0
      # self.include?(num)
      @store[num] == true

  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end



class ResizingIntSet < IntSet
  attr_reader :count, :store
  attr_writer :count
    
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      super(num)
    end
  end

  def remove(num)
    # p @store
    if @store.include?(num)
      super(num) 
      self.count -= 1 
    end
  end

  def include?(num)
    @store[num] == true
    ## @store = [[]]
  end

  def count
  end
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

