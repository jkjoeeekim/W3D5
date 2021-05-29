class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    unless self.parent.nil?
      self.parent.children.delete(self)
    end
    @parent = node
    @parent.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    node.parent = nil
    raise "node is not a child" if node.parent.nil?
  end

  # searchable
  def dfs(target)
    return self if self.value == target

    self.children.each do |child|
      curr_child = child.dfs(target) # this will return either child or nil
      return curr_child unless curr_child.nil?
    end

    nil
  end

  def bfs(target)
    # debugger
    possible_matches = [self]

    until possible_matches.empty?
      # debugger

      possible_match = possible_matches.shift
      if possible_match.value == target
        return possible_match
      else
        possible_matches.concat(possible_match.children)
      end
    end

    nil
  end

  def inspect
    print "#{value}//#{parent}//#{children}"
  end
end
