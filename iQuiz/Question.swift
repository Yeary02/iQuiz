//
//  Question.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/12.
//

import Foundation

class Question {
    var text: String
    var answer: String
    var answers: [String]
    
    init(text: String, answer: String, answers: [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
}
