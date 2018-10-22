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

func listSort(list: [Int]) -> [Int] {
    let n = list.count
    if n < 2 {
        return list
    }
    
    let midIndex = n / 2
    let leftArr = listSort(list: leftList)
    
    let rightList = Array(list[midIndex..<n])
    let rightArr = listSort(list: rightList)
    
    return merge(left: leftArr, right: rightArr)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var result: [Int] = []
    var i = 0, j = 0
    while i < left.count && j < right.count {
        if left[i] <= right[j] {
            result.append(left[i])
            i += 1
        }
        else {
            result.append(right[j])
            j += 1
        }
    }
    //print(result)
    result.append(contentsOf: Array(left[i..<left.count]))
    result.append(contentsOf: Array(right[j..<right.count]))
    return result
}

let items: [Int] = generateList(count: 20)
print("randomlist: \(items)") // 随机数组

let time1 = Date().timeIntervalSince1970 * 1000
let result = listSort(list: items)
let time2 = Date().timeIntervalSince1970 * 1000
print("\(Int(time2 - time1)) ms")

print(result)
