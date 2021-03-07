//
//  Game.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import Foundation

class Game {
    static var shared = Game()
    private var session: GameSession?
    private(set) var results: [GameResults] = []
    private(set) var settings: GameSettings
    
    private var gameResultsCareTaker = GameResultCaretaker()
    private var gameSettingsCareTaker = GameSettingsCaretaker()
    private var userQuestionsCareTaker = UserQuestionsCaretaker()
    
    private var questionsAdapter: GameQuestionAdapter
    
    private init() {
        results = gameResultsCareTaker.loadRecords()
        settings = gameSettingsCareTaker.loadSettings()
        questionsAdapter = GameQuestionAdapter(settings: settings)
    }
    
    func addResult(_ result: GameResults) {
        results.append(result)
        gameResultsCareTaker.saveRecords(records: results)
    }
    
    func saveSettings(_ settings: GameSettings) {
        self.settings = settings
        gameSettingsCareTaker.saveSettings(settings: settings)
    }
    
    func saveUserQuestionsAnswers(_ userQuestionsDto: [UserQuestionDto]) {
        userQuestionsCareTaker.save(questions: userQuestionsDto)
    }
    
    func getUserQuestionsAnswers() -> [UserQuestionDto] {
        return userQuestionsCareTaker.load()
    }
    
    func newGame() {
        session = GameSession(questionsAdapter: questionsAdapter)
    }
    
    func finish() -> GameResults? {
        let results = session?.finish()
        session = nil
        
        return results
    }
    
    func handleAnswer(_ answer: Answer) -> QuestionViewModel? {
        return session?.handleAnswer(answer)
    }
    
    func getQuestionViewModel() -> QuestionViewModel? {
        return session?.getQuestionViewModel()
    }
}

