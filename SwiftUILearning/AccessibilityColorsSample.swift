//
//  AccessibilityColorsSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 4/04/25.
//

import SwiftUI

struct AccessibilityColorsSample: View {
    @Environment(\.colorSchemeContrast) var contrast
    var body: some View {
        VStack{
            Button("Button"){
                
            }.buttonStyle(.borderedProminent)
            Button("Button 2"){
                
            }.buttonStyle(.borderedProminent)
                .tint(.orange)
            Button("Button 3"){
                
            }.buttonStyle(.borderedProminent)
                .tint(.red)
            Button("Button 4"){
                
            }.buttonStyle(.borderedProminent)
                .tint(.green)
            Button("Button 5"){
                
            }.buttonStyle(.borderedProminent)
                .foregroundStyle(.green)
                .tint(.purple)
        }
        .font(.largeTitle)

    }
}

#Preview {
    AccessibilityColorsSample()
}
