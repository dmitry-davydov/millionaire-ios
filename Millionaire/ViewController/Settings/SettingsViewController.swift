//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Дима Давыдов on 23.02.2021.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var difficultSegmentedControll: UISegmentedControl!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareDifficultSegmentedXontroll()
    }
    
    private func prepareDifficultSegmentedXontroll() {
        let savedSettings = Game.shared.settings
        
        print(savedSettings.strategyType)
        
        switch savedSettings.strategyType {
        case .Sequental:
            difficultSegmentedControll.selectedSegmentIndex = 0
        case .Random:
            difficultSegmentedControll.selectedSegmentIndex = 1
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        var difficult: QuestionStrategy = QuestionStrategy.Sequental
        
        switch difficultSegmentedControll.selectedSegmentIndex {
        case 0:
            difficult = QuestionStrategy.Sequental
        case 1:
            difficult = QuestionStrategy.Random
        default:
            break
        }
        
        let settings = GameSettings()
        settings.strategyType = difficult
        
        Game.shared.saveSettings(settings)
        
        dismiss(animated: true, completion: nil)
    }
    
}
