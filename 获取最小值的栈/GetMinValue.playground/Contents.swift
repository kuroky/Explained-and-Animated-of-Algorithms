import UIKit

var itemArr: [Int] = [] // 数据存储栈
var indexArr: [Int] = [] // 辅助栈 存储index

// 压栈
func push(item: Int) {
    itemArr.append(item)
    
    if indexArr.count == 0 {
        indexArr.append(0) // 插入第一个元素时index = 0
    } else {
        
        // 最小值的index
        guard let minVaue = getMin() else {
            return
        }
        
        // 如果新值N<栈中已存在的最小值，index插入辅助栈
        if item < minVaue {
            indexArr.append(itemArr.count - 1)
        }
    }
}

// 出栈
func pop() -> Int? {
    if itemArr.count == 0 {
        return nil
    }
    
    let removeIndex = itemArr.count - 1 // 获取最后一个元素index
    
    // 比较index与辅助栈中的value是否一致
    if removeIndex == indexArr.last {
        indexArr.removeLast()
    }
    
    // 移除最后一个元素
    return itemArr.removeLast()
}

// 获取最小值
func getMin() -> Int? {
    if itemArr.count == 0 {
        return nil
    }
    
    let minValueIndex = indexArr.last!
    return itemArr[minValueIndex]
}

push(item: 4)
push(item: 3)
push(item: 1)
push(item: 5)
push(item: 6)

print(itemArr)
print(getMin() ?? "no value")
