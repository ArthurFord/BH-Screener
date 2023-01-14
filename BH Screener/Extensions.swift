//
//  Extensions.swift
//  BH Screener
//
//  Created by Arthur Ford on 1/12/23.
//

import Foundation
import SwiftUI

extension Text {
    func blueTitle() -> some View {
        self
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
