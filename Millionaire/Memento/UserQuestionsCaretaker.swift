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
    
    func save(settings: [Question]) {
        do {
            let data: UserQuestionsMemento = try encoder.encode(settings)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadSettings() -> [Question] {
        guard let data: UserQuestionsMemento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
