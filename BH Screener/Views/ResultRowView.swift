//
//  ResultRowView.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/14/23.
//

import SwiftUI

struct ResultRowView: View {
    var screening: CESDCScreeningEntity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Date")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(screening.date!, format: .dateTime)")
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("Score")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(screening.score)")
            }
            Spacer()
        }
        
    }
}


