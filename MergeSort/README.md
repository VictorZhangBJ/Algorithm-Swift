# MergeSort(归并排序)


---

目标：把数组按从小到大顺序排序

归并排序是由John von Neumann在1945 率先提出的；在最优情况、最差情况、平均情况下归并排序的时间复杂度**O(n log n)**  都表现的相当优秀。

归并排序背后的主要思想是分而治之：把一个大的问题分为若干个小问题，然后逐个攻克。它的思路是先分割再合并。

假设有一个n元素的数组需要排序，归并排序的步骤如下：

- 把所有元素放入一堆中，此堆为未排序状态。
- 把堆一分为二，此时得到两个未排序的堆。
- 不断地分割堆直到不能分割为止，最后你会得到n个堆，每个堆包含一个元素
- 依次地把堆合并到一起，每次合并中，把元素按顺序排好。这样就会非常简单，因为每个单独的堆都是已拍好序的。

##示例
---

###分割

假设未排序的堆为`[2,1,5,4,9]`,那么经过不断分割以后，会分割成5个堆，每个堆仅有一个元素即：`[2], [1], [5], [4], [9]`，此时他们已经是最小的不可再分。

###合并

现在数组已被分割了，下一步就是合并堆并排序。每次的合并过程你只需关心两个堆，并排序他们即可。

对于上述分割后的堆`[2],[1],[5],[4],[9]`来说，第一步合并将会产生`[2,1] ,[5,4],[9]`；

第二步将会合并`[2,1]` 和 `[5,4]`,此时`[9]`暂时放置一边，得到的结果是`[1,2,4,5],[9]`；

第三部合并将`[9]`合并进去，结果为`[1,2,4,5,9]`。

###自顶向下实现方式

下面是归并排序的实现代码：

```
func mergeSort(array: [Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    let midIndex = array.count / 2
    
    let leftPile = mergeSort(array: Array(array[0 ..< midIndex]))
    let rightPile = mergeSort(array: Array(array[midIndex ..< array.count]))
    
    return merge(leftPile: leftPile, rightPile: rightPile)
    
}
```

下面我们分析代码怎么工作的：

- 如果数组为空或者只包含一个元素，就不用再分割了，直接返回此数组即可
- 找出数组中间位置的下标。
- 用中间下标位置作为末尾把数组分割为左半部分。
- 中间下标作为起始位置把数组分割我右半部分。
- 最后合并所有数值，保证他们是排好序的。

下面是合并函数的实现：

```
func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [Int]()
    
    while (leftIndex < leftPile.count && rightIndex < rightPile.count) {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }else if (leftPile[leftIndex] > rightPile[rightIndex]) {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
    }
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

mergeSort(array: [2,1,5,4,9])  // returns [1,2,4,5,9]
```

上面的函数看起来很可怕，但其思路非常明确，下面我们一步步分析其实现过程：

-  创建两个下标变量来跟踪两个数组的合并进度。
-  创建一个数组来放置排好序的元素，一开始为空，在后续的过程中不断地会有元素被添加进来。
-  第一个while循环比较左堆和右堆取出的数据大小，并按照大小顺序插入到已排序的数组中去。
-  第一个while循环停止的时候，表明leftPile或者rightPile其中一个堆的元素已经完全插入到已排序的数组中了，这时候不需要再挨个比较元素了，只需把另一个堆中剩余元素一次性插入到已排序的数组中去。

下面演示一下merge怎么实现的，假设我们已经拥有排好序的两个堆`leftPile = [1,7,8]`，`rightPile = [3,6,9]`，现在一步步地合并他们：

```
leftPile          rightPile       orderedPile
[1, 7, 8]         [3, 6, 9]           []
 l               r           
```

左边的下标l 指向`1`，右边的下标用r指向`3`，因此第一个添加到排序堆`orderedPile`中元素是`1`,接着左边下标右移动一位。

```
leftPile          rightPile       orderedPile
[1, 7, 8]         [3, 6, 9]         [1]
 -->l              r      
```
现在l指向`7`,r依然指向`3`,这次应该把最小的元素`3`添加到排序堆中去，并且右边下标右移动一位。

```
leftPile          rightPile       orderedPile
[1, 7, 8]         [3, 6, 9]         [1, 3]
    l              -->r      
```

不断重复上述过程，每次从两边中选出最小的元素然后添加到已排序堆中去：

```
leftPile       rightPile       orderedPile
[ 1, 7, 8 ]    [ 3, 6, 9 ]     [ 1, 3, 6 ]
     l              -->r

leftPile       rightPile       orderedPile
[ 1, 7, 8 ]    [ 3, 6, 9 ]     [ 1, 3, 6, 7 ]
     -->l              r

leftPile       rightPile       orderedPile
[ 1, 7, 8 ]    [ 3, 6, 9 ]     [ 1, 3, 6, 7, 8 ]
        -->l           r
```

我们发现这个算法其实非常简单：分别从左往右遍历两个堆，在每一步中找挑选最小的那个元素插入到排序数组中，这样能够起作用的前提是我们的两个堆实现已经排好序的。

###自下往上的实现方式
---

上面的实现方式是自顶向下类型的，因为我们首先把数组分割成小的堆，然后再将他们一一合并起来。当我们排序一个数组的时候，其实可以跳过分割这个步骤，直接合并这些单独的元素，这种方式称为自下往上的排序的方式。

下面是代码片段：

```

```

###性能表现
---

归并排序的速度取决与待排序的数组大小，数组越大，花的时间越多。

不论初始数组是已排序好的还是未排序的都不影响归并排序的时间复杂度，即最优、最坏、平均时间复杂度都是`**O(n log n)**`。

归并排序的一大劣势就是需要一个和原始数组同等大小的临时数组来存储排序元素，它跟快速排序这种
原地排序不同。



