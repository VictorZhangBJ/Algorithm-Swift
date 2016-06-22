//: Playground - noun: a place where people can play

import UIKit

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
    
    
    
    
    
    
//    //计算属性
//    public var USD: Double {
//        get {
//            return 10 * self.USD
//        }
//        set(usd) {
//            USD = usd * 10
//        }
//    }
    
}
