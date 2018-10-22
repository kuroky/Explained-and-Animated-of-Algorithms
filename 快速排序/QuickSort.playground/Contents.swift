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



var items: [Int] = generateList(count: 200)
//print("randomlist: \(items)") // 随机数组

let time1 = Date().timeIntervalSince1970 * 1000
//listSort(list: &items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)
