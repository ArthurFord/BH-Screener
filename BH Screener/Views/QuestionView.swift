    //
    //  QuestionView.swift
    //  BH Screener
    //
    //  Created by Arthur Ford on 1/12/23.
    //

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var screeningManager: ScreeningManager
    
    @State var answerClicked: Answer?
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("CES-DC Screening")
                    .blueTitle()
                Spacer()
                Text("\(screeningManager.index + 1) out of \(screeningManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: screeningManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("During the past week...")
                    .font(.system(size: 24))
                    .bold()
                    .foregroundColor(Color("QTextColor"))
                Text(screeningManager.question)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("QTextColor"))
                    .fixedSize(horizontal: false, vertical: true)
                
                ForEach(screeningManager.answerChoices, id: \.id) { answer in
                    Button {
                        screeningManager.selectAnswer(answer: answer)
                        answerClicked = answer
                    } label: {
                        AnswerRow(answer: answer)
                            .environmentObject(screeningManager)
                            .shadow(color: answer == answerClicked ? .accentColor : Color("BGColor"), radius: 3)
                    }
                }
            }
            Button {
                screeningManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: screeningManager.answerSelected ? Color.accentColor : .gray)
            }
            .disabled(!screeningManager.answerSelected)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BGColor"))
        .navigationBarBackButtonHidden()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(ScreeningManager())
    }
}
