# Queue



---

队列是一种你只能在尾部插入元素，从头部取出元素的线性表。这能保证你第一个插入的元素能够第一个取出来。即先进先出原则（FIFO，firtst-in，first-out）

比如放入队列一个元素

`queue.enqueue(10)`

现在queue里面的元素是`[10]`

`queue.enqueue(20)`

现在queue里面的元素是`[10,20]`

`queue.dequeue()`

现在10将被移除，queue里面剩余的元素是`[20]`

#代码
---
下面是用swift实现的queue数据结构，它仅仅是对数组的一个简单封装。
```
//: Playground - noun: a place where people can play

import UIKit

public struct Queue<T>{
    var array: Array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    

    public mutating func enqueue(t: T) {
        array.append(t)
    }
    
    public func dequeue() -> T? {
        return array.first
    }
    
    public mutating func peek() ->T? {
        if isEmpty {
            return nil
        }else {
            return array.removeFirst()
        }
    }
}

```







