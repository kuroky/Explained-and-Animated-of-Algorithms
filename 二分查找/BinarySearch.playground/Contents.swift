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
    
    var low = 0, high = count - 1
    
    if value > list[high] || value < list[low] {
        return nil
    }
    
    while low <= high {
        let mid = Int((low + high) / 2)
    
        if value > list[mid] {
            low = mid + 1
        }
        else if value < list[mid] {
            high = mid - 1
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
    
    if value > list[high] || value < list[low] {
        return nil
    }
    
    while low <= high {
        let mid = Int((low + high) / 2)
        
        if value > list[mid] {
            low = mid + 1
        }
        else if value < list[mid] {
            high = mid - 1
        }
        else {
            if mid == low || list[mid - 1] != value {
                return mid
            }
            else {
                high = mid - 1
            }
        }
    }
    return nil
}

// 查找最后一个值等于给定的元素
func binarySearch2(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    var low = 0, high = count - 1
    if value < list[low] || value > list[high] {
        return nil
    }
    
    while low <= high {
        let mid = Int((low + high) / 2)
        if value > list[mid] {
            low = mid + 1
        }
        else if value < list[mid] {
            high = mid - 1
        }
        else {
            if mid == high || list[mid + 1] != value {
                return mid
            }
            else {
                low = mid + 1
            }
        }
    }
    return nil
}

// 查找第一个大于等于给定的元素
func binarySearch3(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    var low = 0, high = count - 1
    if value > list[high] {
        return nil
    }
    
    while low <= high {
        let mid = Int((low + high) / 2)
        if value > list[mid] {
            low = mid + 1
        }
        else {
            if mid == low || list[mid - 1] < value {
                return mid
            }
            else {
                high = mid - 1
            }
        }
    }
    
    return nil
}

// 查找最后一个小于等于给定的元素
func binarySearch4(list: [Int], value: Int) -> Int? {
    let count = list.count
    if count < 1 {
        return nil
    }
    
    var low = 0, high = count - 1
    if value < list[low] {
        return nil
    }
    
    while low <= high {
        let mid = Int((low + high) / 2)
        if value < list[mid] {
            high = mid - 1
        }
        else {
            if high == mid || list[mid + 1] > value {
                return mid
            }
            else {
                low = mid + 1
            }
        }
    }
    
    return nil
}

var items: [Int] = generateList(count: 20)
var index = baseBinarySearch(list: items, value: 0)

// 查找第一个值等于给定的元素
//items = [0, 0, 1, 2, 5, 5, 6, 6, 7, 9, 10, 10, 10, 12, 13, 14, 15, 16, 18, 19]
//index = binarySearch1(list: items, value: 10)

//items = [0, 0, 1, 2, 5, 5, 6, 6, 7, 9, 10, 10, 10, 12, 13, 14, 15, 16, 18, 19]
//index = binarySearch2(list: items, value: 10)

// 查找第一个大于等于给定的元素
//items = [0, 0, 1, 2, 5, 5, 6, 6, 7, 9, 10, 10, 10, 12, 13, 14, 15, 16, 18, 19]
//index = binarySearch3(list: items, value: 8)

// 查找最后一个小于等于给定的元素
items = [0, 0, 1, 2, 5, 5, 6, 6, 7, 9, 10, 10, 10, 12, 13, 14, 15, 16, 18, 19]
index = binarySearch4(list: items, value: 13)

print("value :\(items) index:\(index ?? -1)")


