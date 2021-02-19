//
//  GameSession.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

typealias Score = UInt

class GameSession {
    private(set) var currentQuestion: Int = 0
    private(set) var questions: [Question] = []
    private(set) var createdAt: Date
    private(set) var endedAt: Date?
    private(set) var score: Score = 0
    private(set) var answers: [Answer] = []
    
    init() {
        createdAt = Date()
        
        // получить вопросы
        questions = QuestionDataProvider.loadQuestions()
    }
    
    func finish() -> GameResults {
        endedAt = Date()
        
        return GameResults(answers: answers, questions: questions, score: score, started: createdAt, ended: endedAt!)
    }
    
    private func getCurrentQuestion() -> Question? {
        if questions.count <= currentQuestion {
            return nil
        }
        
        return questions[currentQuestion]
    }
    
    func handleAnswer(_ answer: Answer) -> QuestionViewModel {
        answers.append(answer)
        
        guard let q = getCurrentQuestion() else {
            return QuestionViewModel(
                question: nil,
                score: score,
                shouldEndGame: true
            )
        }
        
        let isRight = isAnswerRight(answer, question: q)
        handleScore(isRight)
        
        currentQuestion += 1
        
        let nextQuestion = getCurrentQuestion()
        
        return QuestionViewModel(
            question: nextQuestion,
            score: score,
            shouldEndGame: !isRight || nextQuestion == nil
        )
    }
    
    func getQuestionViewModel() -> QuestionViewModel {
        let q = getCurrentQuestion()
        
        return QuestionViewModel(
            question: q,
            score: score,
            shouldEndGame: q == nil
        )
    }
    
    // начислить очки
    private func handleScore(_ isAnswerRight: Bool) {
        if !isAnswerRight { return }
        
        score += 1
    }
    
    // проверить, правильный ли ответ
    private func isAnswerRight(_ answer: Answer, question: Question) -> Bool {
        // получить текущий вопрос
        // получить вариант
        guard let v = question.variants[answer] else { return false }
        
        return v.isRight
    }
}
