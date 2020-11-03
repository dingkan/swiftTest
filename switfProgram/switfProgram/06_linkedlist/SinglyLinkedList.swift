//
//  SinglyLinkedList.swift
//  switfProgram
//
//  Created by 丁侃 on 2020/11/2.
//  Copyright © 2020 丁侃. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T?
    var next: Node?
    
    init() {}
    
    init(value: T) {
        self.value = value
    }
}

class List<Element: Equatable>{
    private var dumy = Node<Element>()//哨兵节点
    var size: Int {
        var num = 0
        var tmpNode = dumy.next
        while tmpNode != nil {
            num += 1
            tmpNode = tmpNode!.next
        }
        return num
    }
    var isEmpty: Bool {return size > 0}
    
    //find node with value
    func node(with value: Element) -> Node<Element>?{
        var node = dumy.next
        while node != nil {
            if node!.value == value {
                return node
            }
            node = node!.next
        }
        return nil
    }
    
    func node(at index: Int) -> Node<Element>?{
        var num = 1
        var node = dumy.next
        while node != nil {
            if num == index {
                return node
            }
            node = node!.next
            num += 1
        }
        return nil
    }
    
    func insertToHead(node: Node<Element>){
        node.next = dumy.next
        dumy.next = node
    }
    
    func insertToHead(value: Element){
        let newNode = Node(value: value)
        insertToHead(node: newNode)
    }
    
    
    func insert(after node: Node<Element>, newValue:Element){
        let newNode = Node(value: newValue)
        return insert(after: node, newNode: newNode)
    }
    
    func insert(after node: Node<Element>, newNode:Node<Element>){
        newNode.next = node.next
        node.next = newNode
    }
    
    func insert(before node: Node<Element>, newNode:Node<Element>) {
        var lastNode = dumy
        var tmpNode = dumy.next
        
        while tmpNode != nil {
            if tmpNode === node {
                newNode.next = tmpNode
                lastNode.next = newNode
                break
            }
            lastNode = tmpNode!
            tmpNode = tmpNode!.next
        }
    }
    
    func delete(node: Node<Element>){
        var lastNode = dumy
        var tmpNode = dumy.next
        
        while tmpNode != nil {
            if tmpNode === node {
                lastNode.next = tmpNode!.next
                break
            }
            lastNode = tmpNode!
            tmpNode = tmpNode!.next
        }
    }
    
    //删除首个 value 符合要求的节点
    func delete(value: Element){
        var lastNode = dumy
        var tmpNode = dumy.next
         
        while tmpNode != nil {
            if tmpNode!.value == value {
                lastNode.next = tmpNode!.next
                break
            }
            
            lastNode = tmpNode!
            tmpNode = tmpNode!.next
        }
    }
    
}
