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
    private var gameResultsCareTaker = GameResultCaretaker()
    
    private init() {
        results = gameResultsCareTaker.loadRecords()
    }
    
    func addResult(_ result: GameResults) {
        results.append(result)
        gameResultsCareTaker.saveRecords(records: results)
    }
    
    func newGame() {
        session = GameSession()
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

