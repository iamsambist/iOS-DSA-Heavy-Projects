//
//  PeopleNode.swift
//  LLCarousel
//
//  Created by MacBook Two on 11/08/2025.
//

import Foundation

final class PeopleNode: Equatable {
    let id: UUID = UUID()
    var value: People
    var next: PeopleNode?
    weak var previous: PeopleNode?
    
    init(value: People) {
        self.value = value
    }
    static func == (lhs: PeopleNode, rhs: PeopleNode) -> Bool {
        return lhs.id == rhs.id
    }
    
}
