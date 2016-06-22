# Stack


---

栈跟数组非常相似，但是有一些限制。你只能通过push操作将一个元素添加到栈顶、通过pop操作把栈顶的元素移除，或者peek操作来取出栈顶的元素而不移除它。

那么栈的用处到底在哪呢？在有些情况下，你需要在某一时刻添加一些对象到暂存列表中，然后在随后的某一时刻再把这些对象取出来。而对象的添加取出顺序需要符合一定规律---即先进后出。

下面我们举一个例子，push一个number到stack中去
`stack.push(10)`
现在stack里面的数据是`[10]`，添加另外一个数
`stack.push(20)`
现在stack里面的数据是`[10,20]`，再添加一个数
`stack.push(30)`
现在stack里面的数据是`[10,20,30]`，pop一个数出去
`stack.pop()`
现在stack里面剩下的数据是`[10,20]`，返回的数据是`30`
`stack.pop()`
返回`20`，以此类推。直到stack为空时，返回`nil`
用swift可以很轻松的实现stack，只需稍微将array包装一下即可
```
public struct Stack<T>{
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(t: T){
        array.append(t)
    }
    
    public func pop() -> T? {
        return array.last
    }
    
    public mutating func peek() ->T? {
        return array.popLast()
    }
}

```
我们进行push操作的时候，把新的元素插入到array的尾部而不是头部，如果插入头部时间复杂度将是O（n），插入尾部的时间复杂度是O（1）。

当你每次调用函数或者方法的时候，CPU把返回地址放入栈中，当函数结束的时候，CPU再从栈中取出返回地址调回到调用函数的地方。所以当你函数嵌套很多，比如没有结束点的递归函数，会报StackOverFlow。





