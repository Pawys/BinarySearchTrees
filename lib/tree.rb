class Tree
  def initialize(arr)
    @arr = arr
    @root = nil
    build_tree(@arr)
  end
  def build_tree(arr)
    if arr.length == 1
      return Node.new(arr[-1])
    elsif arr.length == 0
      return 
    end
    mid = (arr.length / 2).to_i
    node = Node.new(arr[mid])
    node.left = build_tree(arr[0...mid])
    node.right = build_tree(arr[mid + 1..-1])
    return @root = node
  end
  def insert(value,root=@root)
    if root.nil?
      return node.new(value)
    else
      if value > root.data
        root.right = insert(value,root.right)
      elsif value < root.data
        root.left = insert(value,root.left)
      else
        p "duplicate values not allowed"
      end
      return root
    end
  end
  def delete(value, root = @root)
    if root.data == value
      if root.left.nil? || root.right.nil?
        root = nil
      else
        if root.left.nil?
          root = root.right
        elsif root.right.nil?
          root = root.left
        else
          next_biggest = find_next_biggest(root,root.data)
          delete(next_biggest.data)
          root.data = next_biggest.data
          root
        end
      end
    else
      if value > root.data
        root.right = delete(value,root.right)
      elsif value < root.data
        root.left = delete(value,root.left)
      end
      return root
    end
  end
  def to_s(node = @root, prefix = '', is_left = true)
    to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
  def find_next_biggest(root,value)
    if root.data > value && root.left.nil?
      return root
    else
      if root.left.data > value
        root = find_next_biggest(root.left,value)
      else
        root = find_next_biggest(root.right,value)
      end
      return root
    end
  end
  def find(value, root = @root)
    if value == root.data
      return root
    else
      if value > root.data
        root = find(value,root.right)
      else value < root.data
        root = find(value,root.left)
      end
      root
    end
  end
  def level_order(root = @root,queue = [root],response = [])
    return response if queue.empty?
    queue << root.left unless root.left.nil?
    queue << root.right unless root.right.nil?
    response.push(block_given? ? yield(root.data) : root.data)
    queue.shift()
    response = level_order(queue[0], queue, response) { block_given? ? yield(queue[0].data) : queue[0].data }
  end
  def inorder(root = @root, response=[])
    return response if root.nil?
    response = inorder(root.left,response) {|v| block_given? ?  yield(v) : v}
    response.push(block_given? ? yield(root.data) : root.data)
    response = inorder(root.right,response) {|v| block_given? ?  yield(v) : v}
  end
  def preorder(root = @root,response=[])
    return response if root.nil?
    response.push(block_given? ? yield(root.data) : root.data)
    response = preorder(root.left,response) {|v| block_given? ?  yield(v) : v}
    response = preorder(root.right,response) {|v| block_given? ?  yield(v) : v}
  end
  def postorder(root = @root,response=[])
    return response if root.nil?
    response = postorder(root.left,response) {|v| block_given? ?  yield(v) : v}
    response = postorder(root.right,response) {|v| block_given? ?  yield(v) : v}
    response.push(block_given? ? yield(root.data) : root.data)
  end
  def height(root = @root,height=-1)
    return height if root.nil?

    height += 1

    [height(root.left,height),height(root.right,height)].max
  end
  def depth(value, root = @root, depth=0)
    if value > root.data
      depth += 1
      depth(value,root.right,depth)
    elsif value < root.data
      depth += 1
      depth(value,root.left,depth)
    else
      depth
    end
  end
  def balanced?(root = @root)
    if root == nil
      return true
    end
    if (height(root.left) - height(root.right)).abs > 1
      return false
    end
    return false if balanced?(root.left) == false
    balanced?(root.right)
  end
  def rebalance()
    @arr = inorder()
    build_tree(@arr)
  end
end
