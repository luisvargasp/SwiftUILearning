//
//  ScrollViewReaderSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 26/03/25.
//

import SwiftUI

struct ScrollViewReaderSample: View {
    @State var scroollToIndex : Int  = 0
    @State var text : String  = ""
    var body: some View {
        VStack {
            TextField("Enter a # here  ", text: $text)
                .frame(height : 55)
                .border(Color.gray)
                .padding()
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
            Button ("Click"){
                         withAnimation(.spring()){
                             if let  index = Int(text){
                                 scroollToIndex = index
                             }
                         }
                                    
                                    
                 }
            
            ScrollView(showsIndicators: false){
                
                ScrollViewReader{
                    proxy in
                    
                    ForEach(0..<50){
                        index in
                        Text("This is item \(index)")
                            .font(.headline)
                            .frame(height:200)
                            .frame ( maxWidth: .infinity)
                            .background(.white)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }.onChange(of: scroollToIndex) {
                        proxy.scrollTo(scroollToIndex, anchor: .top)
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    ScrollViewReaderSample()
}
