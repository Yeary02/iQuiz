//
//  FinishViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/14.
//

import UIKit

class FinishViewController: UIViewController {
    var correctNum: Int = 0
    var totalNum: Int = 0
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if correctNum == totalNum {
            resultLabel.text = "Congratulations!"
        } else if correctNum > totalNum / 2 {
            resultLabel.text = "Almost"
        } else {
            resultLabel.text = "Try harder"
        }

        resultLabel.text = "You got \(correctNum) of \(totalNum) of correct."
    }
    

    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        if let mainVC = storyboard?.instantiateViewController(withIdentifier: "main") as? ViewController {
                    self.navigationController?.pushViewController(mainVC, animated: true)
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
