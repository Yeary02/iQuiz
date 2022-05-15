//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/14.
//

import UIKit

class AnswerViewController: UIViewController {
    var quizdata: Quiz? = nil
    var result: String = ""
    var question: String = ""
    var answer: String = ""
    var totalQuestionNum = 0
    var correctNum = 0
    var currentQuestionIndex = -1
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = result
        questionLabel.text = question
        answerLabel.text = answer
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        // 是不是最后一个question
        if currentQuestionIndex == totalQuestionNum - 1 {
            if let finishVC = storyboard?.instantiateViewController(withIdentifier: "finish") as? FinishViewController {
                finishVC.correctNum = self.correctNum
                finishVC.totalNum = self.totalQuestionNum
                self.navigationController?.pushViewController(finishVC, animated: true)
            }
        } else {
            if let questionVC = storyboard?.instantiateViewController(withIdentifier: "quiz") as? QuizViewController {
                questionVC.currentQuestionIndex = currentQuestionIndex + 1
                questionVC.answerSelected = -1
                questionVC.correctNum = self.correctNum
                questionVC.quizdata = self.quizdata
                self.navigationController?.pushViewController(questionVC, animated: true)
            }
        }
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
