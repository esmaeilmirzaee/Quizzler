//
//  Question.swift
//  Quizzler
//
//  Created by Esmaeil MIRZAEE on 2019-09-17.
//  Copyright © 2019 Esmaeil MIRZAEE. All rights reserved.
//

import Foundation

class Question {
    var question: String
    var answer: Bool
    init(text question: String, correctAnswer answer: Bool) {
        self.question = question
        self.answer = answer
    }
}
