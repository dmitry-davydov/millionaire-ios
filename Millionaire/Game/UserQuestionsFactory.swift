//
//  UserQuestionsFactory.swift
//  Millionaire
//
//  Created by Дима Давыдов on 27.02.2021.
//

import Foundation

class UserQuestionsFactory {
    
    let initial: [Question]
    var wrongAnwers: [String] = []
    
    init(initial: [Question]) {
        self.initial = initial
        
        for q in initial {
            for (_, v) in q.variants {
                if v.isRight { continue }
                wrongAnwers.append(v.text)
            }
        }
    }
    
    func constructVariants(dto: UserQuestionDto) -> [Variant] {
        wrongAnwers.shuffle()
        
        var variants: [Variant] = [
            Variant(text: dto.answer, isRight: true)
        ]
        
        for _ in 0..<3 {
            variants.append(Variant(text: wrongAnwers.removeFirst(), isRight: false))
        }
        
        return variants.shuffled()
    }
    
    private func getWrongAnswers() -> [String] {
        var answers: [String] = []
        for q in initial {
            for (_, v) in q.variants {
                if v.isRight { continue }
                answers.append(v.text)
            }
        }
        return answers
    }
}
