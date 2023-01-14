//
//  ScreeningView.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import SwiftUI

struct ScreeningView: View {
    @EnvironmentObject var screeningManager: ScreeningManager
    
    var body: some View {
        if screeningManager.reachedEnd {
            NavigationStack {
                VStack(spacing: 20) {
                    Text("CES-DC Screening")
                        .blueTitle()
                    Text("You have completed the assessment")
                    Text("You scored \(screeningManager.score) points.")
                        .bold()
                    Text("Higher CES-DC scores indicate increasing levels of depression. Weissman et al. (1980), the developers of the CES-DC, have used the cutoff score of 15 as being suggestive of depressive symptoms in children and adolescents. That is, scores over 15 can be indicative of significant levels of depressive symptoms.")
                        .multilineTextAlignment(.leading)
                    Text("Remember that screening for depression can be complex and is only an initial step. Further evaluation is required for children and adolescents identified through a screening process. Further evaluation is also warranted for children or adolescents who exhibit depressive symptoms but who do not screen positive.")
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(Color.accentColor)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BGColor"))
            }
        } else {
            QuestionView()
                .environmentObject(screeningManager)
        }
        
    }
}

struct ScreeningView_Previews: PreviewProvider {
    static var previews: some View {
        ScreeningView()
            .environmentObject(ScreeningManager())
    }
}
