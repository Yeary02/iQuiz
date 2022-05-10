//
//  QuizViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/9.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTableView: UITableView!
    var q = 0 // question order
    
    var items: [Question?]
    var index = 0
    
    init(items: [Question]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerTableView.delegate = self
        answerTableView.dataSource = self
    }
    
    // num of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // num of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // create cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = items[indexPath.row]?.answer
        let cell = tableView.dequeueReusableCell(withIdentifier: "answercell", for: indexPath) as? QuizTableViewCell
        cell?.answerLabel.text = answer?[indexPath.row].text
        return cell!
    }
    
    func configureUI() {
        questionLabel.text = items[q]?.text
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        print(items[indexPath.row] as Any)
          // next quiz question
//    }
    
//    private func checkAnswer(answer: Answer, question: Question) -> Bool {
//        if question.answer.contains(where: { $0.text == answer.text }) && answer.correct {
//            index += 1
//            return true
//        }
//        return false
//    }
}

struct Question {
    let text: String
    let answer: [Answer]
}

struct Answer {
    let text: String
    let correct: Bool
}
