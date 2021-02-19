//
//  GameResults.swift
//  Millionaire
//
//  Created by Дима Давыдов on 19.02.2021.
//

import Foundation



struct GameResults {
    let answers: [Answer]
    let questions: [Question]
    let score: Score
    let started: Date
    let ended: Date
}

extension GameResults: Codable {}
