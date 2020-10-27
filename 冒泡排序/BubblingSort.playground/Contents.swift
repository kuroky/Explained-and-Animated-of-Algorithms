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
    
    for i in 0..<n {
        // 遍历b元素
        for j in 0..<(n - i - 1) {
            // 比较元素并交换位置
            if list[j] > list[j + 1] {
                let temp = list[j+1]
                list[j+1] = list[j]
                list[j] = temp
            }
        }
    }
}

var items: [Int] = generateList(count: 20)
print("source data: \(items)") // 随机数组

let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print("sorted data: \(items)")


