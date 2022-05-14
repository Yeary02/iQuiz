//
//  ViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/9.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    let data = [Quiz(title: "Science!",
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
        cell?.listDescriptionLabel.text = quiz.desc
        cell?.icon.image = UIImage(named: quiz.iconName)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "quiz") as! QuizViewController
//        vc.data =
//        navigationController?.pushViewController(vc, animated: true)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "quiz") as? QuizViewController {
            vc.quizdata = self.data[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func SettingButtonTouchUpInside(_ sender: Any) {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in }))
        self.present(alert, animated: true, completion: { NSLog("The completion handler fired") })
    }
    
}
