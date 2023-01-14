//
//  CESDCScreening.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import Foundation

struct CESDCScreening {
    var results: [Result] = [CESDCQuestions().question1, CESDCQuestions().question2, CESDCQuestions().question3, CESDCQuestions().question4, CESDCQuestions().question5, CESDCQuestions().question6, CESDCQuestions().question7, CESDCQuestions().question8, CESDCQuestions().question9, CESDCQuestions().question10, CESDCQuestions().question11, CESDCQuestions().question12, CESDCQuestions().question13, CESDCQuestions().question14, CESDCQuestions().question15, CESDCQuestions().question16, CESDCQuestions().question17, CESDCQuestions().question18, CESDCQuestions().question19, CESDCQuestions().question20]
    var score: Int64 = 0
    var dateTaken: Date = .now
}

struct Result: Identifiable {
    var id = UUID()
    var question: String
    var answers: [Answer]
}



