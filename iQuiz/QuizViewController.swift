//
//  QuizViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/9.
//

import UIKit

class QuizViewController: UIViewController {
    var quizdata: Quiz? = nil
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    var numQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizdata?.questions[numQuestion].text
        option1Button.setTitle(quizdata?.questions[numQuestion].answers[0], for: .normal)
        option2Button.setTitle(quizdata?.questions[numQuestion].answers[1], for: .normal)
        option3Button.setTitle(quizdata?.questions[numQuestion].answers[2], for: .normal)
        option4Button.setTitle(quizdata?.questions[numQuestion].answers[3], for: .normal)
    }
    
    @IBAction func optionButtonTouchUpInside(_ sender: UIButton) {
        if let answerVC = storyboard?.instantiateViewController(withIdentifier: "answer") as? AnswerViewController {
            let correctAnswer = quizdata?.questions[numQuestion].answer
            
            if correctAnswer != String(sender.tag) {
                switch correctAnswer {
                case "0":
                    answerVC.result = "Sorry! The answer is \((quizdata?.questions[numQuestion].answers[0])!)"
                case "1":
                    answerVC.result = "Sorry! The answer is \((quizdata?.questions[numQuestion].answers[1])!)"
                case "2":
                    answerVC.result = "Sorry! The answer is \((quizdata?.questions[numQuestion].answers[2])!)"
                case "3":
                    answerVC.result = "Sorry! The answer is \((quizdata?.questions[numQuestion].answers[3])!)"
                default:
                    print("Getting Selection Error")
                }
            } else {
                answerVC.result = "You're right!"
            }
            
            self.navigationController?.pushViewController(answerVC, animated: true)
        }
    }
    
    
//    private func checkAnswer(answer: Answer, question: Question) -> Bool {
//        if question.answer.contains(where: { $0.text == answer.text }) && answer.correct {
//            index += 1
//            return true
//        }
//        return false
//    }
}
