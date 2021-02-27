//
//  QuestionBuilder.swift
//  Millionaire
//
//  Created by Дима Давыдов on 25.02.2021.
//

import Foundation

class QuestionBuilder {
    
    func build(userQuestionDto: UserQuestionDto, wrongVariants: [Variant]) -> Question {
        
        var variants = wrongVariants
        variants.append(Variant(text: userQuestionDto.answer, isRight: true))
        variants.shuffle()
        
        var completeVariants: [Answer: Variant] = [:]
        for a in Answer.allCases {
            completeVariants[a] = variants.removeFirst()
        }
        
        return Question(text: userQuestionDto.question, variants: completeVariants)
    }
}
