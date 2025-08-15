//
//  CategoryKey.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import Foundation

enum CategoryKey: String, CaseIterable, Identifiable {
    case Motivation
    case Love
    case Wisdom
    case Success
    
    var id: String { rawValue } 
}

