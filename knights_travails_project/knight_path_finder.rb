require_relative './poly_tree_node'
require 'byebug'
class KnightPathFinder
  def self.valid_moves(pos)
    possible_moves = []

    value = pos.value
    (0..7).each do |horizontal_movement|
      if value[0] + 1 == horizontal_movement || value[0] - 1 == horizontal_movement
        vert_move1 = value[1] + 2
        vert_move2 = value[1] - 2
        possible_moves << PolyTreeNode.new([horizontal_movement, vert_move1]) if (0..7).include?(vert_move1)
        possible_moves << PolyTreeNode.new([horizontal_movement, vert_move2]) if (0..7).include?(vert_move2)
      elsif value[0] + 2 == horizontal_movement || value[0] - 2 == horizontal_movement
        vert_move1 = value[1] + 1
        vert_move2 = value[1] - 1
        possible_moves << PolyTreeNode.new([horizontal_movement, vert_move1]) if (0..7).include?(vert_move1)
        possible_moves << PolyTreeNode.new([horizontal_movement, vert_move2]) if (0..7).include?(vert_move2)
      end
    end

    possible_moves
  end

  attr_reader :start_pos, :root_node
  attr_accessor :considered_positions

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @start_pos = root_node
    @considered_positions = [start_pos]
  end

  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos)

    possible_moves.select! do |move|
      considered_positions.none? do |prev_pos|
        prev_pos.value == move.value
      end
    end

    possible_moves.each do |possible_move|
      pos.add_child(possible_move)
    end

    considered_positions.concat(possible_moves)
    possible_moves
  end

  def build_move_tree(target)
    # queue = considered_positions.dup
    # debugger
    end_node = bfs(target)
    # p end_node

    # until queue.empty?
    #   new_move = queue.shift
    #   if new_move.value == target
    #     end_pos = new_move
    #     return
    #   else
    #     new_move_positions(new_move)
    #     queue.concat(new_move.children)
    #   end
    # end

    move_tree = []
    # debugger
    until end_node.parent.nil?
      move_tree.unshift(end_node.value)
      parent = end_node.parent
      move_tree.unshift(parent.value)
      end_node = parent.parent
    end

    move_tree
  end

  def bfs(target)
    queue = [root_node]

    until queue.empty?
      new_move = queue.shift
      if new_move.value == target
        return new_move
      else
        new_move_positions(new_move)
        queue.concat(new_move.children)
      end
    end
  end
end

# test cases
k = KnightPathFinder.new([0, 0])
p k.build_move_tree([7, 7])
