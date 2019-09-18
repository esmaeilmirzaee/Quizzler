//
//  ViewController.swift
//  Quizzler
//
//  Created by Esmaeil MIRZAEE on 2019-09-17.
//  Copyright © 2019 Esmaeil MIRZAEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UIProgressView!
    
    let questions = QuestionBank()
    var score = 0
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(questions.list.count)
        updateUI()
    }

    /*
     * Answering response button.
     */
    @IBAction func answerButton(_ sender: UIButton) {
        checkAnswer(tag: sender.tag)
    }
    /*
     * Alerting... 😊
     */
    func showAlert(responseType: Int) {
        var alert: UIAlertController?
        
        let action = UIAlertAction(title: "Awsome", style: .default, handler: nil)
        if questionNumber == questions.list.count {
            
        }
        
        if responseType == 1 {
            alert = UIAlertController(title: "Yes", message: "✔️", preferredStyle: .alert)
        } else if responseType == 0 {
            alert = UIAlertController(title: "No", message: "✖️", preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: "Response", message: "\(score) out of \(questions.list.count)", preferredStyle: .alert)
        }
        alert!.addAction(action)
        present(alert!, animated: true, completion: nil)
    }
    
    /*
     * Refreshing User Interface.
     */
    func updateUI() {
        if questionNumber < questions.list.count {
            questionLabel.text = questions.list[questionNumber].question
            progressNumberLabel.text = "\(questionNumber + 1)/\(questions.list.count)"
            scoreLabel.text = "Score: \(score)"
            progressLabel.frame.size.width = (view.frame.size.width / CGFloat(questions.list.count)) * (CGFloat(questionNumber + 1))
        } else {
            let alert = UIAlertController(title: "Done", message: "You have finished answering questions. Do you want to start over?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in self.startOver()})
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    /*
     *  Calling the next question
     */
    func nextQuestion() {
        questionNumber += 1
    }
    
    /*
     * Checking the answer.
     */
    func checkAnswer(tag: Int) {
        var userAnswered = false
        
        if (1 == tag) {
            userAnswered = true
        } else {
            userAnswered = false
        }
        if userAnswered == questions.list[questionNumber].answer {
            score += 1
            ProgressHUD.showSuccess("Awesome")
//            showAlert(responseType: 1)
        } else {
            ProgressHUD.showError("Wrong 😔")
//            showAlert(responseType: 0)
        }
        
        nextQuestion()
        updateUI()
    }
    
    /*
     * Starting over.
     */
    func startOver() {
        questionNumber = 0
        score = 0
        updateUI()
    }
}

