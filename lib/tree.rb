require_relative 'node'
class Tree
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  def insert(score, title)
    new_node = Node.new(score, title)

    unless @nodes.empty?
      @nodes.each do |node|
        if node.score < new_node.score
          if node.right_node.nil?
            node.right_node = new_node
            new_node.left_node = node
          end
        elsif node.score > new_node.score
          if node.left_node.nil?
            node.left_node = new_node
            new_node.right_node = node
          end
        end
      end
    end

    @nodes << new_node
    return depth_of(score)
  end

  def include?(wanted_score)
    @nodes.each do |node|
      if node.score == wanted_score
        return true
      end
    end

    return false
  end

  def depth_of(score)
    if include?(score) == false
      return nil
    end

    node = find_by_score(score)
    node.depth
  end

  def find_by_score(wanted_score)
    @nodes.each do |node|
      if node.score == wanted_score
        return node
      end
    end
  end

  def max
    max_score = 0
    @nodes.each do |node|
      if node.score > max_score
        max_score = node.score
      end
    end

    return max_score
  end

  def min
    min_score = 99
    @nodes.each do |node|
      if node.score < min_score
        min_score = node.score
      end
    end

    return min_score
  end

  def sort
    sorted_nodes = []
    hashed_nodes = []
    min_score = self.min
    first_node = find_by_score(min_score)

    sorted_nodes << first_node

    unless sorted_nodes.last.right_node.nil?
      sorted_nodes << sorted_nodes.last.right_node
    end

    sorted_nodes.each do |node|
      binding.pry
      hashed_nodes << Hash.new("#{node.title}" => node.score)
    end

    return hashed_nodes
  end
end
