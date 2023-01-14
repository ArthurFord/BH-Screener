//
//  DisclaimerView.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/14/23.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                Text("Clinical Diagnosis not given")
                    .blueTitle()
                    .multilineTextAlignment(.center)
                VStack(spacing: 30) {
                    Text("This app does not provide medical advice and is not intended to be a substitute for professional advice, diagnosis or treatment. The information contained in this app is for informational purposes only. For an accurate diagnosis of a substance abuse or mental health disorder, you should seek an evaluation from a qualified mental health professional.")
                    Text("If you feel you are experiencing a potentially life-threatening problem, please call 911.")
                        
                }
                .lineSpacing(10)
                    .font(.headline)
                    .foregroundColor(Color("QTextColor"))
                VStack(spacing: 30) {
                    Text("Privacy Information")
                        .blueTitle()
                    .multilineTextAlignment(.center)
                    Text("We take your privacy seriously. This app keeps your information on this device only, unless you share your results using the export function. It does not store your information on any other device, computer, or server. Deleting this app will delete all data associated with the app.")
                        .lineSpacing(10)
                        .font(.headline)
                        .foregroundColor(Color("QTextColor"))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        }
        .background(Color("BGColor"))
    }
}

struct Disclaimer_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
