import UIKit

class BinaryTreeNode: NSObject {
    var value: Int!
    
    var leftNode: BinaryTreeNode? // 左节点
    
    var rightNode: BinaryTreeNode? // 右节点
    
    class func createTree(values: [Int]) -> BinaryTreeNode? {
        if values.count < 1 {
            return nil
        }
        
        var root: BinaryTreeNode!
        for i in 0..<values.count {
            let value = values[i]
            root = BinaryTreeNode.addTreeNode(treeNode: root, value: value)
        }
        return root
    }
    
    private class func addTreeNode(treeNode: BinaryTreeNode?, value: Int) -> BinaryTreeNode? {
        var node = treeNode
        if node == nil {
            node = BinaryTreeNode()
            node?.value = value
        }
        else if value <= (node?.value)! {
            node?.leftNode = BinaryTreeNode.addTreeNode(treeNode: node?.leftNode, value: value)
        }
        else {
            node?.rightNode = BinaryTreeNode.addTreeNode(treeNode: node?.rightNode, value: value)
        }
        return node
    }
}

let array = [1, 2, 10, 8, 3, 4, 5, 6, 7, 9]
let tree = BinaryTreeNode.createTree(values: array)
print(tree ?? "?")

func exchangeNode(node: BinaryTreeNode?) -> BinaryTreeNode {
    
    node?.leftNode = exchangeNode(node: node?.rightNode)
    node?.rightNode = exchangeNode(node: node?.leftNode)
    return BinaryTreeNode()
}

func depthOfBinary(nodeTree: BinaryTreeNode?) -> Int {
    guard let node = nodeTree else {
        return 0
    }
    
    //        if node.leftNode == nil && node.rightNode == nil {
    //            return 1
    //        }
    
    let left = depthOfBinary(nodeTree: node.leftNode)
    
    let right = depthOfBinary(nodeTree: node.rightNode)
    
    return max(left, right) + 1
}
