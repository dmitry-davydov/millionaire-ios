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
        case .sequental:
            difficultSegmentedControll.selectedSegmentIndex = 0
        case .random:
            difficultSegmentedControll.selectedSegmentIndex = 1
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        var difficult: QuestionStrategy = QuestionStrategy.sequental
        
        switch difficultSegmentedControll.selectedSegmentIndex {
        case 0:
            difficult = QuestionStrategy.sequental
        case 1:
            difficult = QuestionStrategy.random
        default:
            break
        }
        
        let settings = GameSettings()
        settings.strategyType = difficult
        
        Game.shared.saveSettings(settings)
        
        dismiss(animated: true, completion: nil)
    }
    
}
