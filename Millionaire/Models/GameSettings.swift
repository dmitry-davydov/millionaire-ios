//
//  GameSettings.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

enum QuestionStrategy: Int, Codable {
    case random
    case sequental
}

class GameSettings: Codable {
    var strategyType: QuestionStrategy = .sequental
}
