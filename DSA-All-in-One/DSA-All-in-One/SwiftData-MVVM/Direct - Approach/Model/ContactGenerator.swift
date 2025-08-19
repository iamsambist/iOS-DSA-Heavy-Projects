//
//  ContactGenerator.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 18/08/2025.
//

import Foundation

struct ContactGenerator {
    static let shared = ContactGenerator()
    // Generate contact with random string and phone number
    func generateContact() -> Contact {
        return Contact(
            name: randomName(),
            phoneNumber: randomPhoneNumber()
        )
    }

    // Generate random name
    func randomName(
        length: Int = 8
    ) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var name = ""
        
        (0..<length).forEach { _ in
            let randomChar = letters.randomElement()
            if let randomChar = randomChar {
                name.append(randomChar)
            }
        }
        
        return name
    }

    // Generate random phone number
    func randomPhoneNumber(
        length: Int = 8
    ) -> String {
        var phoneNumber = ""
        
        (0..<length).forEach { _ in
            let randomInt = Int.random(in: 0...9)
            phoneNumber += "\(randomInt)"
        }
        
        return phoneNumber
    }
}
