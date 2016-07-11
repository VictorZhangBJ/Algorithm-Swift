//: Playground - noun: a place where people can play

import UIKit


func mergeSort(array: [Int]) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    let midIndex = array.count / 2
    
    let leftPile = mergeSort(array: Array(array[0 ..< midIndex]))
    let rightPile = mergeSort(array: Array(array[midIndex ..< array.count]))
    
    return merge(leftPile: leftPile, rightPile: rightPile)
    
}

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











