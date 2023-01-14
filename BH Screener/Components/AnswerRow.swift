//
//  AnswerRow.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var screeningManager: ScreeningManager
    
    var answer: Answer
    @State var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            Text(answer.text)
                .bold()
            
            if answer.isSelected {
                Spacer()
                Image(systemName: "checkmark.circle.fill")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.accentColor)
        .background(Color(.white))
        .cornerRadius(10)
        .shadow(color: isSelected ? .accentColor : Color("BGColor"), radius: 5)
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Not At All", score: 3))
            .environmentObject(ScreeningManager())
    }
}
