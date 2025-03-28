//
//  HashableSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 27/03/25.
//

import SwiftUI

struct MyModel : Hashable {
    
    
    let title: String
   
}

struct HashableSample: View {
    
    let data = [MyModel(title: "ONE"), MyModel(title: "TWO"), MyModel(title: "THREE"), MyModel(title: "FOUR"),MyModel(title: "FIVE")]
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                ForEach(data  , id: \.self){
                    item in
                    
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableSample()
}
