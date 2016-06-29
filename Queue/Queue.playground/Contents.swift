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
 