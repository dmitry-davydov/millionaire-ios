//
//  GameSettingsCaretaker.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation

typealias GameSettingsMemento = Data

class GameSettingsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "gameSettings"
    
    func saveSettings(settings: GameSettings) {
        do {
            let data: GameSettingsMemento = try encoder.encode(settings)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadSettings() -> GameSettings {
        guard let data: GameSettingsMemento = UserDefaults.standard.data(forKey: key) else {
            return GameSettings()
        }
        
        do {
            return try decoder.decode(GameSettings.self, from: data)
        } catch {
            print(error.localizedDescription)
            return GameSettings()
        }
    }
}
