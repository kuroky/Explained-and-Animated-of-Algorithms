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
    
    // 从index = 1的元素开始计算
    for i in 1..<n {
        let temp = list[i]
        var insertIndex = i // 目标插入位置
        
        for j in (0..<i).reversed() {
            if temp > list[j] { // 比较中间元素并交换位置
                break
            }
            list[j + 1] = list[j]
            insertIndex = j
        }
        list[insertIndex] = temp
    }
}

var items: [Int] = generateList(count: 200)
let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)

