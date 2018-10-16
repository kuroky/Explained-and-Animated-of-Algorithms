import UIKit

var items = [5, 3, 4, 7, 2, 8, 6, 9, 1]

func listSort(list: inout [Int]) {
    let n = list.count
    if n <= 1 {
        return
    }
    
    // 从index = 1的元素开始计算
    for i in 1..<n {
        let temp = list[i]
        for j in (0..<i).reversed() {
            if list[j] > temp { // 比较中间元素
                list.swapAt(j, j + 1)
            }
            else {
                break
            }
        }
    }
}

listSort(list: &items)
print(items)

