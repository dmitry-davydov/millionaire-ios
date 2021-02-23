//
//  RandomQuestionStrategy.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

class RandomQuestionStrategy: QuestionStrategyProcotol {
    func getQuestions(initial: [Question]) -> [Question] {
        var q = initial
        q.shuffle()
        
        return q
    }
}
