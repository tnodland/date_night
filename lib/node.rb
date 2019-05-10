class Node
  attr_reader :title,
              :score

  attr_accessor :right_node,
                :left_node

  def initialize(score, title)
    @score = score
    @title = title
    @right_node = nil
    @left_node = nil
  end

  def depth
    if @right_node.nil? && @left_node.nil?
      return 0
    elsif @right_node.nil? || @left_node.nil?
      return 1
    else
      return 2
    end
  end
end
