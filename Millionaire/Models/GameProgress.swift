//
//  GameProgress.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

struct GameProgress: CustomStringConvertible {
    var description: String {
        return "\(current + 1)/\(total)"
    }
    
    let current: Int
    let total: Int
    
    
}
