//
//  Quiz.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/10.
//

import Foundation

class Quiz {
    var title: String
    var desc: String
    var iconName: String
    var questions: [Question]
    
    init(title: String, desc: String, iconName: String, questions: [Question]) {
        self.title = title
        self.desc = desc
        self.iconName = iconName
        self.questions = questions
    }
}


/*
[
    { "title":"Science!",
      "desc":"Because SCIENCE!",
      "questions":[
        {
          "text":"What is fire?",
          "answer":"1",
          "answers":[
            "One of the four classical elements",
            "A magical reaction given to us by God",
            "A band that hasn't yet been discovered",
            "Fire! Fire! Fire! heh-heh"
          ]
        }
      ]
    },
    { "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
      "questions":[
        {
          "text":"Who is Iron Man?",
          "answer":"1",
          "answers":[
            "Tony Stark",
            "Obadiah Stane",
            "A rock hit by Megadeth",
            "Nobody knows"
          ]
        },
        {
          "text":"Who founded the X-Men?",
          "answer":"2",
          "answers":[
            "Tony Stark",
            "Professor X",
            "The X-Institute",
            "Erik Lensherr"
          ]
        },
        {
          "text":"How did Spider-Man get his powers?",
          "answer":"1",
          "answers":[
            "He was bitten by a radioactive spider",
            "He ate a radioactive spider",
            "He is a radioactive spider",
            "He looked at a radioactive spider"
          ]
        }
      ]
    },
    { "title":"Mathematics", "desc":"Did you pass the third grade?",
      "questions":[
         {
           "text":"What is 2+2?",
           "answer":"1",
           "answers":[
             "4",
             "22",
             "An irrational number",
             "Nobody knows"
           ]
         }
      ]
   }
]
*/
