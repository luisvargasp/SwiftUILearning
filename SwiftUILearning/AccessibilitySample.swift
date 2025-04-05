//
//  AccessibilitySample.swift
//  SwiftUILearning
//
//  Created by FerVP on 4/04/25.
//

import SwiftUI

struct AccessibilitySample: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<10){_ in
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName:"heart.fill")
                            Text("Welcome to my app")
                        }.font(.headline)
                            .padding(.trailing,10)
                        
                        Text("This is a  long  some text that expands to multiple times from its initial size")
                            .font(.subheadline)
                            .frame(maxWidth : .infinity)
                            .lineLimit(3)
                            
                        
                    } .frame(height : 100)
                        .background(.red)
                        .minimumScaleFactor(dynamicTypeSize.isAccessibilitySize ? 0.2 : 1)
                    
                
                       
                    
                }
            }.listStyle(.plain)
            
            .navigationTitle("Accessibility")
            
        }
        
    }
}

#Preview {
    AccessibilitySample()
}
