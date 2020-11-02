//
//  myArray.swift
//  switfProgram
//
//  Created by 丁侃 on 2020/10/29.
//  Copyright © 2020 丁侃. All rights reserved.
//

import Foundation
//Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。
public struct MyArray<Element>{
    private var data: [Element]
    private var capacity = 0
    private var count = 0
    
    init(defaultElement:Element, capacity:Int) {
        //初始化
        data = [Element](repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }
    
    func find(at index: Int) -> Element? {
        guard index >= 0, index < count else{
            return nil
        }
        return data[index]
    }
    
    //mutating 默认情况下，在结构体中，实例方法中是不可以修改值类型的属性，使用mutating后可修改属性的值
    mutating func delete(at index: Int) -> Bool{
        guard index >= 0, index < count else{
            return false
        }
        
        for i in index ..< count - 1{
            data[i] = data[i + 1]
        }
        count -= 1
        return true
    }
    
    mutating func insert(value: Element, at index: Int) -> Bool{
        guard index >= 0, index < count , count < capacity else {
            return false
        }
        

        for i in (index ... count - 1).reversed() {
            data[i + 1] = data[i]
        }
        data[index] = value
        count += 1
        return true
    }
    
    mutating func add(value:Element) -> Bool{
        guard count < capacity else {
            return false
        }
        data[count] = value
        count += 1
        return true
    }
    
    func printAll(){
        print("\(data)")
    }
}
