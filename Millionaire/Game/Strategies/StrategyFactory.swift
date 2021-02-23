//
//  StrategyFactory.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

protocol QuestionStrategyProcotol {
    func getQuestions(initial: [Question]) -> [Question]
}

class StrategyFactory {
    class func factory(strategy: QuestionStrategy) -> QuestionStrategyProcotol {
        switch strategy {
        case .Random:
            return RandomQuestionStrategy()
        case .Sequental:
            return SequentalQuestionStrategy()
        }
    }
}
