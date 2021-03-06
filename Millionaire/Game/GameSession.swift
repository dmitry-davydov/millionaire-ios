//
//  GameSession.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

typealias Score = UInt

class GameSession {
    private(set) var currentQuestion: Int = 0 {
        didSet {
            self.notificateGameProgress()
        }
    }
    
    private(set) var questions: [Question]
    private(set) var createdAt: Date
    private(set) var score: Score = 0
    private(set) var answers: [Answer] = []
    
    init(questionsAdapter: GameQuestionAdapter) {
        self.questions = questionsAdapter.getQuestions()
        createdAt = Date()
        
        notificateGameProgress()
    }
    
    private func notificateGameProgress() {
        NotificationCenter.default.post(
            name: .GameProgressNotification,
            object: GameProgress(current: currentQuestion, total: questions.count)
        )
    }
    
    func finish() -> GameResults {
        return GameResults(answers: answers, questions: questions, score: score, started: createdAt, ended: Date())
    }
    
    private func getCurrentQuestion() -> Question? {
        if questions.count <= currentQuestion {
            return nil
        }
        
        return questions[currentQuestion]
    }
    
    func handleAnswer(_ answer: Answer) -> QuestionViewModel {
        answers.append(answer)
        
        let q = getCurrentQuestion()!
        let isRight = isAnswerRight(answer, question: q)
        handleScore(isRight)
        
        currentQuestion += 1
        
        let nextQuestion = getCurrentQuestion()
        
        return buildQuestionViewModel(q: nextQuestion, shouldEndGame: !isRight || nextQuestion == nil)
    }
    
    private func buildQuestionViewModel(q: Question?, shouldEndGame: Bool) -> QuestionViewModel {
        return QuestionViewModel(
            question: q,
            score: score,
            shouldEndGame: shouldEndGame
        )
    }
    
    func getQuestionViewModel() -> QuestionViewModel {
        let q = getCurrentQuestion()
        return buildQuestionViewModel(q: q, shouldEndGame: q == nil)
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
