### Binary Search Trees 

This project implements a binary search tree in Ruby, as part of the Binary Search Tree exercise from [The Odin Project](https://www.theodinproject.com/). It provides functionalities to create, manipulate, and balance a binary search tree.

## Usage

```ruby
# Example usage
require_relative 'tree.rb'

# Create a binary search tree
arr = [7, 3, 1, 9, 5, 12]
binary_tree = Tree.new(arr)

# Insert a value into the tree
binary_tree.insert(10)

# Delete a value from the tree
binary_tree.delete(5)

# Traverse the tree in different orders
binary_tree.inorder { |v| puts v }
binary_tree.preorder { |v| puts v }
binary_tree.postorder { |v| puts v }
binary_tree.level_order { |v| puts v }

# Search for a value in the tree
binary_tree.find(9)

# Get the height of the tree
puts binary_tree.height

# Get the depth of a specific value
puts binary_tree.depth(7)

# Check if the tree is balanced
puts binary_tree.balanced?

# Rebalance the tree
binary_tree.rebalance
