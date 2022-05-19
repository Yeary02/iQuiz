//
//  PopViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/16.
//

import UIKit
import Foundation
import SwiftUI

protocol PopViewControllerProtacol {
    func checkNowButtonTouchUpInside(_ theurl: String)
    func checkNowButtonTouchUpInside(_ sender: Any)
}

class PopViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var checkNowButton: UIButton!
    var delegate: PopViewControllerProtacol?
    @AppStorage("historyUrl") private var historyUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.text = historyUrl
    }

    @IBAction func checkNowButtonTouchUpInside(_ sender: Any) {
        historyUrl = textField.text!
        self.delegate?.checkNowButtonTouchUpInside(textField.text!)
        self.delegate?.checkNowButtonTouchUpInside(sender)
        self.dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
/*
var data = [Quiz(title: "Local!",
                 desc: "Because SCIENCE!",
                 iconName: "science",
                 questions: [Question(text: "What is fire?", answer: "1", answers: ["One of the four classical elements",
                                                                                    "A magical reaction given to us by God",
                                                                                    "A band that hasn't yet been discovered",
                                                                                    "Fire! Fire! Fire! heh-heh"])]),
            Quiz(title: "Marvel Super Heroes",
                             desc: "Avengers, Assemble!",
                             iconName: "avenger",
                             questions: [Question(text: "Who is Iron Man?", answer: "1", answers: ["Tony Stark",
                                                                                                   "Obadiah Stane",
                                                                                                   "A rock hit by Megadeth",
                                                                                                   "Nobody knows"]),
                                         Question(text: "Who founded the X-Men?", answer: "2", answers: ["Tony Stark",
                                                                                                         "Professor X",
                                                                                                         "The X-Institute",
                                                                                                         "Erik Lensherr"]),
                                         Question(text: "How did Spider-Man get his powers?", answer: "1",
                                                  answers: ["He was bitten by a radioactive spider",
                                                            "He ate a radioactive spider",
                                                            "He is a radioactive spider",
                                                            "He looked at a radioactive spider"])]),
            Quiz(title: "Mathematics",
                             desc: "Did you pass the third grade?",
                             iconName: "math",
                             questions: [Question(text: "What is 2+2?", answer: "1", answers: ["4",
                                                                                               "22",
                                                                                               "An irrational number",
                                                                                               "Nobody knows"])]),
]
*/
