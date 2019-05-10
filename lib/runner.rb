require 'pry'
require_relative 'node'
require_relative 'tree'


tree = Tree.new
tree.insert(50, "movie")
tree.insert(55, "movie2")
tree.insert(45, "movie3")
binding.pry
