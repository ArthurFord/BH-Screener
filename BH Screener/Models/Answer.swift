//
//  Answer.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import Foundation

struct Answer: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var score: Int
    var isSelected = false
}
