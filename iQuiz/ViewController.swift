//
//  ViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/9.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    struct Quiz {
        let title: String
        let description: String
        let iconName: String
        let items: [Question]
    }

    struct Question {
        let text: String
        let answer: [Answer]
    }

    struct Answer {
        let text: String
        let correct: Bool
    }
    
    let data: [Quiz] = [Quiz(title: "Mathematics",
                             description: "Do some simple calculations",
                             iconName: "math",
                             items: [Question(text: "disarray", answer: [Answer(text: "disorder(T)", correct: true),
                                                                        Answer(text: "dissident", correct: false),
                                                                        Answer(text: "dignity", correct: false),
                                                                        Answer(text: "diagram", correct: false)]),
                                     Question(text: "disclose", answer: [Answer(text: "enclose", correct: false),
                                                                         Answer(text: "trick", correct: false),
                                                                         Answer(text: "uncover", correct: true),
                                                                         Answer(text: "display", correct: false)])]),
                        Quiz(title: "Marvel Super Heroes",
                             description: "Do you know them?",
                             iconName: "avenger",
                             items: [Question(text: "parsimony", answer: [Answer(text: "injection", correct: false),
                                                                        Answer(text: "hut", correct: false),
                                                                        Answer(text: "stinginess(T)", correct: true),
                                                                        Answer(text: "brass", correct: false)]),
                                    Question(text: "devolve", answer: [Answer(text: "involve", correct: false),
                                                                        Answer(text: "fall(T)", correct: true),
                                                                        Answer(text: "mutter", correct: false),
                                                                        Answer(text: "prevail", correct: false)])]),
                        Quiz(title: "Science",
                             description: "Do you remember",
                             iconName: "science",
                             items: [Question(text: "concomitant", answer: [Answer(text: "national", correct: false),
                                                                        Answer(text: "attendant(T)", correct: true),
                                                                        Answer(text: "curious", correct: false),
                                                                        Answer(text: "financial", correct: false)]),
                                     Question(text: "novel", answer: [Answer(text: "active", correct: false),
                                                                         Answer(text: "fertile", correct: false),
                                                                         Answer(text: "unprecedented(T)", correct: true),
                                                                         Answer(text: "gaseous", correct: false)])])
                        ]
                        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }

    // num of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // num of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // create cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.listTitleLabel.text = quiz.title
        cell?.listDescriptionLabel.text = quiz.description
        cell?.icon.image = UIImage(named: quiz.iconName)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        
//        let itemList = data[indexPath.row].items // 为啥itemList是VC.question
//        let vc = QuizViewController(items: itemList)
//        vc.configureUI()
//        // data[indexPath.row].iconName = "checked"
//        tableView.reloadData()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    // why not working!
    @IBAction func SettingButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        self.present(alert, animated: true, completion: { NSLog("The completion handler fired") })
    }
    
}
