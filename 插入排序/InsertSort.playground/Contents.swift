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
        for j in (0..<i).reversed() {
            if list[j] > temp { // 比较中间元素并交换位置
                list[j + 1] = list[j]
                list[j] = temp
            }
            else {
                break
            }
        }
    }
}

var items: [Int] = generateList(count: 2000)
let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)

