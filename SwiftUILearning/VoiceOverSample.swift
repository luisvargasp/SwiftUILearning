//
//  VoiceOverSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 4/04/25.
//

import SwiftUI

struct VoiceOverSample: View {
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Preseferences")){
                    Toggle("Volume", isOn: $isActive)
                    HStack{
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "On" : "Off")
                            .accessibilityHidden(true)
                    }
                    .background()
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHint("Double tap to toggle")
                    .accessibilityValue(isActive ? "volume On" : "Volume Off")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                }
                
                Section(header: Text("Aplication")){
                    Button("Favourites"){
                        
                    }
                    //.accessibilityRemoveTraits(.isButton)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "heart.fill")
                    }.accessibilityLabel("Favourites")
                    
                    Text("Favourites")
                        .accessibilityAddTraits(.isButton)
                        .onTapGesture {
                    }
                }
                VStack{
                    Text("Content")
                        .frame(maxWidth : .infinity,alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing : 8){
                            ForEach(0..<10){
                                x in
                                VStack{
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width : 100, height : 100)
                                    Text("Item \(x)")
                                        
                                }.onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x) image")
                                .accessibilityHint("Double tap to view item \(x)")
                            }
                            
                        }
                        
                    }
                }
                
                
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    VoiceOverSample()
}
