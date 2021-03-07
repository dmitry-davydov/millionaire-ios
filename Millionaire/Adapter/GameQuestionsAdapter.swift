//
//  GameQuestionsAdapter.swift
//  Millionaire
//
//  Created by Дима Давыдов on 27.02.2021.
//

import Foundation

/// GameQuestionAdapter даптер для работы initial вопросов
/// Фабрики для составления вопросво из пользовательских
/// Билдера для создании вопросов
class GameQuestionAdapter {
    private let userQuestionsCaretaker = UserQuestionsCaretaker()
    private let questionBuilder = QuestionBuilder()
//    private let questionFactory = UserQuestionsFactory()
    
    private let settings: GameSettings
    
    init(settings: GameSettings) {
        self.settings = settings
    }
    
    
    func getQuestions() -> [Question] {
        let initialQuestions = QuestionDataProvider.loadQuestions()
        let factory = UserQuestionsFactory(initial: initialQuestions)
        
        var questions = [Question]()
        
        for dto in userQuestionsCaretaker.load() {
            let variants = factory.constructVariants(dto: dto)
            questions.append(questionBuilder.build(userQuestionDto: dto, wrongVariants: variants))
        }
        
        questions += initialQuestions
        
        return StrategyFactory
            .factory(strategy: settings.strategyType)
            .getQuestions(initial: questions)
    }
    
    
    
    
    
    
    
}
