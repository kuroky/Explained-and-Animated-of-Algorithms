import UIKit

var items = [6, 5, 4, 2, 3, 3, 2, 5, 4]

func listSort(list: inout [Int]) {
    let n = list.count
    
    if n <= 1 {
        return
    }
    
    for i in 0..<n {
        var flag = false
        for j in 0..<(n - i - 1) {
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
