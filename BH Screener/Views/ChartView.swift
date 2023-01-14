//
//  ChartView.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/14/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    @EnvironmentObject var screeningManager: ScreeningManager
    
    var body: some View {
        Chart(screeningManager.savedEntities) { entity in
            RuleMark(y: .value("Cutoff", 15))
                .foregroundStyle(Color.mint)
                .lineStyle(StrokeStyle(dash: [4.0]))
            LineMark(x: .value("Date", entity.date!),
                     y: .value("Score", entity.score))
            .symbol(.diamond)
            .interpolationMethod(.catmullRom)
            
        }
        .chartForegroundStyleScale(["Score" : Color.accentColor])
        .frame(height: 200)
        .padding()
        HStack {
            Text("- - Cutoff Score")
                .font(.caption)
                .foregroundColor(.mint)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(ScreeningManager())
    }
}
