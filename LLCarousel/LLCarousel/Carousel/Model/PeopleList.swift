//
//  PeopleList.swift
//  LLCarousel
//
//  Created by MacBook Two on 11/08/2025.
//

import Foundation

final class PeopleList {
    
    private var head: PeopleNode?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(_ person: People) {
        
        let newNode = PeopleNode(value: person)
        if isEmpty {
            head = newNode
            head?.next = newNode
            head?.previous = newNode
        } else {
            guard let tail = head?.previous else { return }
            tail.next = newNode
            newNode.previous = tail
            newNode.next = head
            head?.previous = newNode
        }
    }
    
    func getHead() -> PeopleNode? {
        return head
    }
    
    func getPreviousNode(_ currentNode: PeopleNode?) -> PeopleNode? {
        return currentNode?.previous
    }
    
    func nextNode(_ currentNode: PeopleNode?) -> PeopleNode? {
        return currentNode?.next
    }
    
}
