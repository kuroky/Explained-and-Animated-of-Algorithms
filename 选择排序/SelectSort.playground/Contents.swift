import UIKit

/*
 
 1. 从数列中寻找最小值
 2. 将最小值和数列最左边的数字进行交换，排序结束。回到1
 
 */

/// 生成随机数组
/// - Parameter count: 数组长度
/// - Returns: 返回指定长度的随机整数数组
func generateList(count: Int) -> [Int] {
    let randomCount = count > 20 ? count : 20
    var list: [Int] = []
    for _ in 0..<randomCount {
        let item = arc4random() % UInt32(randomCount)
        list.append(Int(item))
    }
    return list
}

/// 选择排序
/// - Parameter list: 数组
func listSort(list: inout [Int]) {
    // 边界判断
    let n = list.count
    if n <= 1 {
        return
    }
    
    for i in 0..<n {
        
        // 获取最小元素index
        guard let minIndex = getMin(list: list, fromIndex: i) else {
            return
        }
        
        // 交换最小元素与前一个数
        let temp = list[i]
        list[i] = list[minIndex]
        list[minIndex] = temp
    }
}

///从未排序的数组中选择最小值
/// - Parameters:
///   - list: 固定长度的数组
///   - fromIndex: 开始查找的index
/// - Returns: 返回获取的值对应的index
func getMin(list: [Int], fromIndex: Int) -> Int? {
    if fromIndex >= list.count {
        return nil
    }
    
    var minIndex = fromIndex
    for i in fromIndex..<list.count {
        if list[i] < list[minIndex] {
            minIndex = i
        }
    }
    return minIndex
}

var items: [Int] = generateList(count: 50)
//print("randomlist: \(items)") // 随机数组

let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)
