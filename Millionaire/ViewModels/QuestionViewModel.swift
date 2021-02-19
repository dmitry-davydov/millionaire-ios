//
//  QuestionViewModel.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

struct QuestionViewModel {
    var question: Question?
    var score: Score
    var shouldEndGame: Bool = false
}
