//
//  QouteListHandler.swift
//  DSA-All-in-One
//
//  Created by MacBook Two on 13/08/2025.
//

import Foundation

protocol QouteListHandler {
    var quotes: [String] { get set }
}

class MotivationQuotes: QouteListHandler {
    
    var quotes: [String] = [
        "The only way to do great work is to love what you do.",
        "Your time is limited, don't waste it living someone else's life.",
        "The future belongs to those who believe in the power of imagination.",
        "Your potential is unlimited. There is nothing that can stop you from achieving your dreams."]
}

class LoveQuotes: QouteListHandler {
    
    var quotes: [String] = [
        "I love you not because of who you are, but because of who I am when I am with you.",
        "Love is composed of a single soul inhabiting two bodies.",
        "You miss 100% of the shots you don't take.",
        "The greatest love of all is the love of oneself."]
}

class WisdomQuotes: QouteListHandler {
    
    var quotes: [String] = [
        "Wisdom is knowing what to ignore.",
        "The only way to do great work is to love what you do.",
        "Your time is limited, don't waste it living someone else's life.",
        "The future belongs to those who believe in the power of imagination."]
}

class SuccessQuotes: QouteListHandler {
    
    var quotes: [String] = [
        "Success is not final, and failure is not fatal: It is the courage to continue that counts.",
        "Your potential is unlimited. There is nothing that can stop you from achieving your dreams.",
        "The only limit to our greatness is ourselves.",
        "Believe you can and you're halfway there."]
}
