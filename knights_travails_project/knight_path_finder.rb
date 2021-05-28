require_relative './poly_tree_node.rb'

class KnightPathFinder
  attr_reader :start_pos, :root_node
  
  def self.valid_moves(pos)
    possible_moves = []

    # pos.each do |horizontal|
    #   pos.each do |vertical|
        
    #   end
    # end

    (0..7).each do |horizontal_movement|
      if pos[0] + 1 == horizontal_movement || pos[0] - 1 == horizontal_movement
        vert_move_1 = pos[1] + 2
        vert_move_2 = pos[1] - 2
        possible_moves << [horizontal_movement, vert_move_1] if (0..7).include?(vert_move_1)
        possible_moves << [horizontal_movement, vert_move_2] if (0..7).include?(vert_move_2)
      elsif pos[0] + 2 == horizontal_movement || pos[0] - 2 == horizontal_movement
        vert_move_1 = pos[1] + 1
        vert_move_2 = pos[1] - 1
        possible_moves << [horizontal_movement, vert_move_1] if (0..7).include?(vert_move_1)
        possible_moves << [horizontal_movement, vert_move_2] if (0..7).include?(vert_move_2)
      end
    end

    possible_moves
  end

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @start_pos = root_node
  end

  def build_move_tree

  end
end