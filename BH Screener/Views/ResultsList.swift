    //
    //  ResultsList.swift
    //  BH Screener
    //
    //  Created by Arthur Ford on 1/14/23.
    //

import SwiftUI
import Charts

struct ResultsList: View {
    @EnvironmentObject var screeningManager: ScreeningManager
    @Environment(\.displayScale) var displayScale
    private var stockImage = Image(systemName: "photo")
    
    var body: some View {
        VStack {
            Text("Prior Screenings")
                .blueTitle()
            Text("CES-DC Screening")
                .bold()
            ChartView()
                .environmentObject(screeningManager)
            ShareLink("Export", item: render(), preview: SharePreview(Text("CES-DC Results"), image: render()))
            Text("Screening Details")
                .blueTitle()
                .padding(.top, 10)
                .foregroundColor(.accentColor)
            List(screeningManager.savedEntities) { entity in
                ResultRowView(screening: entity)
                .swipeActions {
                    Button(role: .destructive) {
                        screeningManager.delete(entity: entity)
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
            }
            .listStyle(.sidebar)
            .background(Color("BGColor"))
            .scrollContentBackground(.hidden)
        }
        .background(Color("BGColor"))
        
    }
    
    
    @MainActor func render() -> Image {
        
        let renderer = ImageRenderer(content: ChartView().environmentObject(screeningManager))
        renderer.scale = displayScale
        renderer.proposedSize = ProposedViewSize(width: 350, height: 200)
        
        if let uiImage = renderer.uiImage {
            let newImage = Image(uiImage: uiImage)
            return newImage
        }
        return stockImage
    }
}

struct ResultsList_Previews: PreviewProvider {
    static var previews: some View {
        ResultsList()
            .environmentObject(ScreeningManager())
    }
}
