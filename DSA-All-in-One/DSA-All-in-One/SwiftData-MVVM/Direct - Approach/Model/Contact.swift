//
//  Contact.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 18/08/2025.
//

import Foundation
import SwiftData

@Model
class Contact {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var phoneNumber: String
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    
    init(
        name: String,
        phoneNumber: String
    ) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

extension Contact {
    // dummy contacts
    static let contacts = [
        Contact(
            name: "darren",
            phoneNumber: "20658251"
        ),
        Contact(
            name: "thiores",
            phoneNumber: "80220912"
        )
    ]
}
