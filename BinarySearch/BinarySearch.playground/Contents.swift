//: Playground - noun: a place where people can play

import UIKit

let numbers = [8,3,5,4,6,7,10]
func linearSearch<T: Equatable> (array: [T], _ key: T) -> Int? {
    for index in 0...array.count {
        if key == array[index] {
            return index
        }
    }
    return nil
}

linearSearch(array: numbers, 5)

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




