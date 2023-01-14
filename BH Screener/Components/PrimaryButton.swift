//
//  PrimaryButton.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(Color("BGColor"))
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            //.shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
