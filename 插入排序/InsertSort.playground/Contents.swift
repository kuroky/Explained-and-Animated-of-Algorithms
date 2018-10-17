import UIKit

var items: [Int] = []
for _ in 0..<20 {
    let item = arc4random() % 20
    items.append(Int(item))
}
print(items) // 随即数组

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

