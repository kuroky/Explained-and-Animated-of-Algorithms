import UIKit

func generateList(count: Int) -> [Int] {
    let randomCount = count > 20 ? count : 20
    var list: [Int] = []
    for _ in 0..<randomCount {
        let item = arc4random() % UInt32(randomCount)
        list.append(Int(item))
    }
    return list
}

func listSort(list: inout [Int]) {
    // 边界判断
    let n = list.count
    if n <= 1 {
        return
    }
    
    for i in 0..<n {
        
        var minIndex = i
        
        // 遍历获取最小元素index
        for j in i..<n {
            if list[minIndex] > list[j] {
                minIndex = j
            }
        }
    
        // 交换最小元素与前一个数
        let temp = list[i]
        list[i] = list[minIndex]
        list[minIndex] = temp
    }
}

var items: [Int] = generateList(count: 20000)
//print("randomlist: \(items)") // 随机数组

let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)
