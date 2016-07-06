# BinarySearch


---

目标：从数组中查找一个元素是否存在，如果存在返回其位置

大多数情况下，swift的`indexOf()`函数能很好的满足我们的要求，比如：

```
let numbers = [8, 3, 5, 4, 6, 7, 1, 10]
numbers.indexOf(4)  // returns 3
```

内置的`indexOf()`函数使用的是线下查找的方式，它的实现方式大体如下所示

```
let numbers = [8,3,5,4,6,7,10]
func linearSearch<T: Equatable> (array: [T], _ key: T) -> Int? {
    for index in 0...array.count {
        if key == array[index] {
            return index
        }
    }
    return nil
}

linearSearch(array: numbers, 5)        //return 2
```

有什么问题吗？`linearSearch`会从头遍历你的数组直到找到你要查找的那个元素，最坏的情况下，你会遍历整个数组发现此数组不存在你要找的数据。

平均情况下，你需要遍历半个数组才能达到要求，如果你的数组超级大的话，将会非常耗时。

#分而治之

---

最经典的方法就是*二分查找*，把数组连续的一分为二知道找到目标元素为止。

对于有n个元素的数组进行线性查找的时间复杂度不是**O(n)**而是**O(logn)**;比如对一个拥有1,000,000个元素的数组来进行线性查找只需20步即可完成操作，因为`log_2(1,000,000) = 19.9`.对于一个拥有10亿元素的数组来说也仅仅需要**30**步即可。

听起来貌似不错，但是有一个前提：数组必须是排好序的，但在现实世界中这其实不是什么难题。

下面是二分法查找步骤：

- 把数组从中间一分为二，判断你的目标元素是在左侧那一半还是右侧。
- 怎样判断目标元素是在左边还是右边？这就是我们要把数组排序的原因，这样就能简单使用`<` 或者`>`来比较大小从而判断目标元素在哪一侧。
- 如果目标元素落在左侧半区，那么继续以下步骤：将左半区继续分成两个部分，然后判定目标元素在哪个半区；如果一开始目标元素落在右侧半区，那么就将右侧半区继续分成两部分，接着判定目标元素落在哪个部分。
- 重复上述步骤值得找到目标元素为止，如果数组已经是最小不能再分割，就应该得出结论：本数组中没有找到目标元素

现在你知道为什么叫’二分法‘查找了吧，就是把一个数组的连续的一分为二直到不能再分为止。这种’分而治之‘的做法能够一步步的缩小查找范围，从而快速的找到目标元素所在。

#代码片段
---

下面是二分法查找的递归版本：
```

func binarySearch<T: Comparable> (array: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    }else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if key > array[midIndex] {
            return binarySearch(array: array, key: key, range: midIndex+1 ..< range.upperBound)
        }else if key < array[midIndex] {
            return binarySearch(array: array, key: key, range: range.lowerBound ..< midIndex)
        }else{
            return midIndex
        }
    }
}

let numbers1 = [2,3,5,6,7,9,10,11]
binarySearch(array: numbers1, key: 10, range: 0 ..< numbers1.count)    //returns 6
```

**注意**：numbers1数组是已经排好序的，二分法的前提必须是已排序好的数组。

我们虽然不断地把数组一分为二，但是我们没有创建新的数组，而是利用了swift的`Range`对象来标记数组的位置。一开始range的范围是整个数组，`0..< array.count`,随着我们分割数组，range也变得越来越小。

**注意：** `range.endInex`指向的位置是数组末尾元素的下一个，也就是10个元素的数组的range是`0 ..< 10`，由于数组下坐标是从0开始的，所以10个元素数组的末尾元素对应的下标是9，不是10。所以要谨记这一点，`endIndex`指向数组末尾元素的下一个，`array[range.endIndex]`是报数组越界异常错误的。

#递归还是迭代
---

二分法查找用递归实现起来非常的方便，利用重复逻辑不断的分割数组来实现效果。但是并不一定非得用递归来实现，用迭代实现起来其实效率更高，只需用一个单层循环来代替递归调用即可。

下面是迭代版本的二分法查找：

```
func binarySearch1<T: Comparable> (array: [T], key: T) -> Int? {
    var range = 0 ..< array.count
    while range.startIndex < range.endIndex {
        let midIndex = range.startIndex + (range.endIndex - range.startIndex) / 2
        if key > array[midIndex] {
            range = midIndex+1 ..< range.endIndex
        }else if key < array[midIndex] {
            range = range.startIndex ..< midIndex
        }else{
            return midIndex
        }
    }
    return nil
}

binarySearch1(array: numbers1, key: 9)     //returns 6

```

#结束语
---
数组必须是有序的会不会限制到二分法查找的使用？看情况而定，数组排序需要耗费时间的，先排序再二分法查找的效率是没有线性查找高的。在需要一次排序多次查找的情景下，二分法非常适用和方便。










