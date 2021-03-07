//
//  UserQuestionsCaretaker.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

typealias UserQuestionsMemento = Data

class UserQuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "userQuestions"
    
    func save(questions: [UserQuestionDto]) {
        do {
            let data: UserQuestionsMemento = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [UserQuestionDto] {
        guard let data: UserQuestionsMemento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([UserQuestionDto].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
