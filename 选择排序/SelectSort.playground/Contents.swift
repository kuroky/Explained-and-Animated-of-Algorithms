import UIKit

var items: [Int] = []

for _ in 0..<20 {
    let random = arc4random() % 20
    items.append(Int(random))
}
print("randomlist: \(items)") // 随机数组

func listSort(list: inout [Int]) {
    // 边界判断
    let n = items.count
    if n <= 1 {
        return
    }
    
    for j in 0..<n {
        // 排序后的最小元素的index
        guard let minIndex = getMin(list: list, fromIndex:j) else {
            return
        }
        
        // 交换最小元素与前一个数的index
        list.swapAt(minIndex, j)
    }
}

// 遍历获取最小元素
func getMin(list: [Int], fromIndex: Int) -> Int? {
    let n = list.count
    
    if n == 0 {
        return nil
    }
    
    if n == 1 {
        return 0
    }
    
    var index = fromIndex
    for i in fromIndex..<n  {
        if list[index] > list[i] {
            index = i
        }
    }
    return index
}

listSort(list: &items)
print(items)
