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
    @IBOutlet weak var submitButton: UIButton!
    var currentQuestionIndex = 0
    var answerSelected = -1
    var correctNum = 0
    var checkedOut = UserDefaults.standard.bool(forKey: "enabled_preference")
    //print("Check out button is \(checkedOut) checked out.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizdata?.questions[currentQuestionIndex].text
        option1Button.setTitle(quizdata?.questions[currentQuestionIndex].answers[0], for: .normal)
        option2Button.setTitle(quizdata?.questions[currentQuestionIndex].answers[1], for: .normal)
        option3Button.setTitle(quizdata?.questions[currentQuestionIndex].answers[2], for: .normal)
        option4Button.setTitle(quizdata?.questions[currentQuestionIndex].answers[3], for: .normal)
    
    }
    
    @IBAction func optionButtonTouchUpInside(_ sender: UIButton) {
        switch sender.tag {
            case 1:
                answerSelected = 1
                option1Button.isSelected = true
                option2Button.isSelected = false
                option3Button.isSelected = false
                option4Button.isSelected = false
            case 2:
                answerSelected = 2
                option1Button.isSelected = false
                option2Button.isSelected = true
                option3Button.isSelected = false
                option4Button.isSelected = false
            case 3:
                answerSelected = 3
                option1Button.isSelected = false
                option2Button.isSelected = false
                option3Button.isSelected = true
                option4Button.isSelected = false
            case 4:
                answerSelected = 4
                option1Button.isSelected = false
                option2Button.isSelected = false
                option3Button.isSelected = false
                option4Button.isSelected = true
            default:
                answerSelected = -1
        }
    }
    
    
    @IBAction func submitButtonTouchUpInside(_ sender: UIButton) {
        checkedOut = true
        if let answerVC = storyboard?.instantiateViewController(withIdentifier: "answer") as? AnswerViewController {
            let correctIndex = quizdata?.questions[currentQuestionIndex].answer
            if correctIndex != String(answerSelected) {
                answerVC.result = "Sorry! You got it wrong."
            } else {
                answerVC.result = "You're right!"
                correctNum += 1
            }
            let ci = Int(correctIndex!)! - 1
            let ans = (quizdata?.questions[currentQuestionIndex].answers[ci])
            answerVC.question = "Question: \((quizdata?.questions[currentQuestionIndex].text)!)"
            answerVC.answer = "Correct Answer: \(ans!)"
            answerVC.totalQuestionNum = (quizdata?.questions.count)!
            answerVC.correctNum = self.correctNum
            answerVC.currentQuestionIndex = self.currentQuestionIndex
            answerVC.quizdata = self.quizdata
            self.navigationController?.pushViewController(answerVC, animated: true)
        }
    }
}
