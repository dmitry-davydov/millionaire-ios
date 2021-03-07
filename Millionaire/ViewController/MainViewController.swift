//
//  MainViewController.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import UIKit

class MainViewController: UIViewController, GameViewControllerDelegate {

    private let moveToResultsSegue = "moveToResultsSegue"
    private let moveToGameSegue = "moveToGameSegue"
    private let moveToGameSettings = "moveToGameSettings"
    private let moveToAddQuestion = "moveToAddQuestion"
    
    @IBOutlet weak var startGamgeButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    
    @IBAction func startGamePressed(_ sender: UIButton) {
        performSegue(withIdentifier: moveToGameSegue, sender: nil)
        
    }
    @IBAction func resultsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: moveToResultsSegue, sender: nil)
    }
    
    @IBAction func settingsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: moveToGameSettings, sender: nil)
    }
    
    @IBAction func addQuestionPressed(_ sender: UIButton) {
        performSegue(withIdentifier: moveToAddQuestion, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case moveToGameSegue:
            guard let vc = segue.destination as? GameViewController else { return }
            vc.delegate = self
        
        default: break
        }
    }
    
    func didEndGame(_ result: GameResults) {
        Game.shared.addResult(result)
    }
}
