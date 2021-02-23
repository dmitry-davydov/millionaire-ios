//
//  GameViewController.swift
//  Millionaire
//
//  Created by Дима Давыдов on 18.02.2021.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(_ result: GameResults)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var variantAUIButton: UIButton!
    @IBOutlet weak var variantBUIButton: UIButton!
    @IBOutlet weak var variantCUIButton: UIButton!
    @IBOutlet weak var variantDUIButton: UIButton!
    
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Game.shared.newGame()
        guard let viewModel = Game.shared.getQuestionViewModel() else { return }
        
        renderScreen(viewModel: viewModel)
    }
    
    
    @IBAction func variantAPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.A)
    }
    
    @IBAction func variantBPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.B)
    }
    
    @IBAction func variantCPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.C)
    }
    
    @IBAction func variantDPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.D)
    }

    private func handleVariant(answer: Answer) {
        guard let vm = Game.shared.handleAnswer(answer) else {return}
        renderScreen(viewModel: vm)
    }
    private func renderScreen(viewModel: QuestionViewModel) {
        
        // завершить игру
        if viewModel.shouldEndGame {
            print("end game")
            guard let results = Game.shared.finish() else { return }
            
            delegate?.didEndGame(results)
            
            dismiss(animated: true, completion: nil)
            return
        }
        
        guard let q = viewModel.question else { return }
        questionLabel.text = q.text
        
        variantAUIButton.setTitle(q.variants[Answer.A]?.text, for: .normal)
        variantBUIButton.setTitle(q.variants[Answer.B]?.text, for: .normal)
        variantCUIButton.setTitle(q.variants[Answer.C]?.text, for: .normal)
        variantDUIButton.setTitle(q.variants[Answer.D]?.text, for: .normal)
        
        scoreLabel.text = "Score: \(viewModel.score)"
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
