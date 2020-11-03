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
    let n = list.count
    // 边界判断
    if n <= 1 {
        return
    }        
    
    // 从index = 1的元素开始计算, 假设左侧的数据已经排序
    for i in 1..<n {
        let temp = list[i]
        var insertIndex = i // 目标插入位置
        
        for j in (0..<i).reversed() { // 与左边排序好的数据轮询比较
            if temp > list[j] { // 大于左侧数据，index 不变
                break
            }
            list[j + 1] = list[j] // 小与左侧数据， 交换位置，直到左侧完成左侧轮询
            insertIndex = j
            print(list)
        }
        list[insertIndex] = temp
    }
}

var items: [Int] = generateList(count: 20)
print("items \(items)")
let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)



