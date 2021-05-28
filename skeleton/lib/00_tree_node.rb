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
    node.children << self unless node.nil? || node.children.include?(self)
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
      curr_child = child.dfs(target)
      curr_child = child unless curr_child.nil?
    end

    nil
  end
end

