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
        print("start game")
        
        performSegue(withIdentifier: moveToGameSegue, sender: nil)
        
    }
    @IBAction func resultsPressed(_ sender: UIButton) {
        print("results")
        
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
        print("results")
        print(result)
        
        Game.shared.addResult(result)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
