//
//  Question.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

enum Answer: Int, Codable, CaseIterable {
    case A
    case B
    case C
    case D
}

struct Variant: Codable {
    var text: String
    var isRight: Bool
}

struct Question: Codable {
    var text: String
    var variants: [Answer: Variant]
    
    func rightAnswer() -> Variant? {
        for (_, v) in variants {
            if !v.isRight { continue }
            return v
        }
        
        return nil
    }
}


