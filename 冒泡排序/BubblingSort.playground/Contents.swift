import UIKit

var items: [Int] = []
for _ in 0..<20 {
    let item = arc4random() % 20
    items.append(Int(item))
}
print(items) // 随机数组

func listSort(list: inout [Int]) {
    let n = list.count
    // 边界判断
    if n <= 1 {
        return
    }
    
    for i in 0..<n {
        var flag = false
        // 遍历b元素
        for j in 0..<(n - i - 1) {
            // 比较元素并交换位置
            if list[j] > list[j + 1] {
                list.swapAt(j, j + 1)
                flag = true
            }
        }
        if flag == false {
            break
        }
    }
}

listSort(list: &items)
print(items)
