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
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtonList: [UIButton]!
    
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutAnswerButtonList()
        
        NotificationCenter.default.addObserver(self, selector: #selector(progressDidChange(_:)), name: .GameProgressNotification, object: nil)
        
        
        Game.shared.newGame()
        guard let viewModel = Game.shared.getQuestionViewModel() else { return }
        
        renderScreen(viewModel: viewModel)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .GameProgressNotification, object: nil)
    }
    
    @objc func progressDidChange(_ notification: Notification) {
        guard let progress = notification.object as? GameProgress else { return }
        
        progressLabel.text = progress.description
    }
    
    private func layoutAnswerButtonList() {
        for button in answerButtonList {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(named: "buttonBorder")!.cgColor
            button.layer.cornerRadius = 5
        }
    }
    
    @IBAction func variantAPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.a)
    }
    
    @IBAction func variantBPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.b)
    }
    
    @IBAction func variantCPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.c)
    }
    
    @IBAction func variantDPressed(_ sender: UIButton) {
        handleVariant(answer: Answer.d)
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
        
        for (index, button) in answerButtonList.enumerated() {
            let answer = Answer.init(rawValue: index)
            button.setTitle(q.variants[answer!]?.text, for: .normal)
        }
        
        scoreLabel.text = "Score: \(viewModel.score)"
    }
}
