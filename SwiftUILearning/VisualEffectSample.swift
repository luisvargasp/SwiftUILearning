//
//  VisualEffectSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 4/04/25.
//

import SwiftUI

struct VisualEffectSample: View {
    var body: some View {
        
        
        
        Text("HIII")
            .padding()
            .background(.red)
            .visualEffect{
                content , geometry in
                content
                    .grayscale(geometry.size.width  >= 200 ? 1 : 0)
                
            }
        
        
        
    }
}

#Preview {
    VisualEffectSample()
}
