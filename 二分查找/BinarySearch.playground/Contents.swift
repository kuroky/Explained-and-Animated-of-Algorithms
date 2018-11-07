import UIKit

func generateList(count: Int) -> [Int] {
    let randomCount = count > 20 ? count : 20
    var list: [Int] = []
    for _ in 0..<randomCount {
        let item = arc4random() % UInt32(randomCount)
        list.append(Int(item))
    }
    return list.sorted()
}

func baseBinarySearch(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    var low = 0
    var high = count - 1
    while low <= high {
        let mid = Int((low + high) / 2)
        if value > list[mid] {
            low = mid
        }
        else if value < list[mid] {
            high = mid
        }
        else {
            return mid
        }
    }
    
    return nil
}

// 查找第一个值等于给定的元素
func binarySearch1(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    var low = 0, high = count - 1
    while low <= high {
        let mid = Int((low + high) / 2)
        if value > list[mid] {
            low = mid
        }
        else if value < list[mid] {
            high = mid
        }
        else {
            
        }
    }
    return nil
}

func binarySearch2(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    return nil
}

func binarySearch3(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    return nil
}

func binarySearch4(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    return nil
}

var items: [Int] = generateList(count: 20)
let index = baseBinarySearch(list: items, value: 5)

// 查找第一个值等于给定的元素
// 查找最后一个值等于给定的元素
// 查找第一个大于等于给定的元素
// 查找最后一个小于等于给定的元素

print("value :\(items) index:\(index ?? -1)")


