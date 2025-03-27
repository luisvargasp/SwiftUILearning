//
//  MultipleSheetsSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 26/03/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    
    let title: String
    
}

//binding
//multiple sheets
// use $item

struct MultipleSheetsSample: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        VStack{

            ForEach(0..<20){
                index in
                Button("Button \(index)"){
                   
                    selectedModel = .init(title: "\(index)")
                
                }
                
            }
        }.sheet(item : $selectedModel ){ model in
            NextScreen(selectedModel : model)
            
        }
        
    }
}

struct NextScreen : View {
    let  selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsSample()
}
