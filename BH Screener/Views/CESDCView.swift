    //
    //  CESDCView.swift
    //  BH Screener
    //
    //  Created by Arthur Ford on 12/20/22.
    //

import SwiftUI

struct CESDCView: View {
    
    @StateObject var screeningManager = ScreeningManager()
    
    var body: some View {
        NavigationStack {
            GeometryReader() { geo in
                VStack(spacing: 40) {
                    Image("doctor")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: geo.size.width / 1.5)
                    VStack(spacing: 30) {
                        Text("Depression Scale for Children")
                            .blueTitle()
                            .multilineTextAlignment(.center)
                        Text("Center for Epidemiological Studies \n Depression Scale for Children (CES-DC)")
                            .foregroundColor(Color("AccentColor"))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        NavigationLink {
                            ScreeningView()
                                .environmentObject(screeningManager)
                        } label: {
                            PrimaryButton(text: "Let's Begin!")
                        }
                        NavigationLink {
                            ResultsList()
                                .environmentObject(screeningManager)
                        } label: {
                            PrimaryButton(text: "Prior results")
                        }
                        NavigationLink {
                            DisclaimerView()
                        } label: {
                            Text("Disclaimers and Privacy")
                                .foregroundColor(Color("AccentColor"))
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color("BGColor"))
            .navigationBarBackButtonHidden()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CESDCView()
    }
}
