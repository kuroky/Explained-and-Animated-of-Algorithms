import UIKit

var items = [5, 3, 4, 7, 2, 8, 6, 9, 1]

func listSort(list: inout [Int]) {
    let n = list.count
    if n <= 1 {
        return
    }
    
    // 从index = 1的元素开始计算
    for i in 1..<n {
        let value = list[i]
        let m = i - 1
        
        for j in (0...m).reversed() {
            if list[j] > value {
                list[j + 1] = list[j]
                list[j] = value
            }
            else {
                break
            }
        }
    }
}

listSort(list: &items)
print(items)

