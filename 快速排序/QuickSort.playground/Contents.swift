import UIKit

func generateList(count: Int) -> [Int] {
    let randomCount = count > 5 ? count : 5
    var list: [Int] = []
    for _ in 0..<randomCount {
        let item = arc4random() % UInt32(randomCount)
        list.append(Int(item))
    }
    return list
}

func listSort(list: inout [Int], left: inout Int, right: inout Int) -> [Int] {
    if left >= right {
        return list
    }
    
    let n = list.count
    if n < 2 {
        return list
    }
    
    var low = left
    var high = right
    let key = list[left]
    while left < right {
        while left < right && list[right] >= key {
            right -= 1
        }
        list[left] = list[right]
        while left < right && list[left] <= key {
            left += 1
        }
        list[right] = list[left]
    }
    list[left] = key
    
    listSort(list: &list, left: &low, right: &(left - 1))
    listSort(list: &list, left: &(left + 1), right: &high)
    return list
}

var items: [Int] = generateList(count: 10)
//print("randomlist: \(items)") // 随机数组

let time1 = Date().timeIntervalSince1970 * 1000
listSort(list: &items, left: &0, right: &(items.count - 1))
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(items)
