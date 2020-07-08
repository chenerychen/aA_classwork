class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value   
        @parent = nil 
        @children = [] 
    end 

    def parent=(new_node) ###
      if new_node.nil?
        @parent = nil 
      elsif !self.parent.nil?
        self.parent.children.delete(self)
        @parent = new_node
        @parent.children << self
      else
        @parent = new_node
        @parent.children.delete(self)
        @parent.children << self
      end
    end 

    def add_child(child_node)
        @children << child_node 
        child_node.parent = self 
    end 

    def remove_child(child_node) 
        raise "error" unless @children.include?(child_node)
        @children.delete(child_node) 
        child_node.parent = nil  
    end 

    def dfs(target_value)
        if target_value == self.value 
           return self 
        else  
           self.children.each do |child|
              depth = child.dfs(target_value)
              return depth unless depth.nil? 
          end 
        end 
      nil 
    end

    def bfs(target_value)
      queue = []
      queue.unshift(self)

      until queue.empty?
        first_node = queue.pop
        return first_node if first_node.value == target_value

        first_node.children.each do |child|
          queue.unshift(child)
        end
      end
    end

end
