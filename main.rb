require_relative 'lib/tree.rb'
tree = Tree.new((Array.new(15) { rand(1..100) }))
puts tree
p tree.balanced?
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
(Array.new(15) { rand(101..200) }).each do |i|
  tree.insert(i)
end
puts tree
p tree.balanced?
tree.rebalance
puts tree
p tree.balanced?
p tree.level_order
p tree.preorder
p tree.postorder
p tree.inorder
