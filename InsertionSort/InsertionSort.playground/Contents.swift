//: Playground - noun: a place where people can play

import UIKit

var myArray = [8,3,5,4,6]


func insertionSort(array: [Int]) -> [Int] {
    var a = array
    for index in 1...a.count - 1 {
        var j = index
        while j >= 1{
            if a[j] < a[j-1] {
                swap(&a[j-1], &a[j])
            }
            j -= 1
        }
    }
    return a
}



var arr2 = [3,4,0,10,11,13,10,8,7,2,18]
insertionSort(array: arr2)

func insertionSort2(array: [Int]) -> [Int] {
    var a = array
    for index in 1...a.count - 1 {
        var j = index
        let temp = a[j]
        while (j > 0 && temp < a[j-1]){
            a[j] = a[j-1]
            j -= 1
        }
        a[j] = temp
    }
    return a
    
}

insertionSort2(array: arr2)

func insertionSort<T>(array: [T], _ isOrederBefore: (T, T) -> Bool) ->[T] {
    var a = array
    for index in 1...a.count - 1 {
        var j = index
        let temp = a[j]
        while (j > 0 && isOrederBefore(temp, a[j-1])) {
            a[j] = a[j-1]
            j -= 1
        }
        a[j] = temp
    }
    return a
}

var numbers = [8,3,5,4,6,1,10]
insertionSort(array: numbers, { (t1, t2) -> Bool in
    return t1 < t2
})

