//
//  ScrollViewPagingSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 5/04/25.
//

import SwiftUI

struct ScrollViewPagingSample: View {
    @State private var position  : Int? = nil
    var body: some View {
        Button("Scroll TO"){
         position = 5
        }
        ScrollView(.vertical){
          
           VStack(spacing : 0){
                ForEach(0..<10){
                    index in
                    Rectangle()
                        //.frame(width: 300,height: 300)
                        .overlay{
                            Text("\(index)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        }.frame(maxWidth : .infinity,alignment: .center)
                        .padding(.vertical,5)
                        .containerRelativeFrame(.vertical)
                        .id(index)
                }

            }
        } .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
        .scrollBounceBehavior(.basedOnSize)
        .scrollPosition(id : $position, anchor: .center)
        
    }
}

#Preview {
    ScrollViewPagingSample()
}
