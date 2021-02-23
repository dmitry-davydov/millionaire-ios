//
//  GameSettings.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

enum QuestionStrategy: Int, Codable {
    case Random
    case Sequental
}

class GameSettings: Codable {
    var strategyType: QuestionStrategy = .Sequental
}
