//
//  MagnificationGesture.swift
//  SwiftUILearning
//
//  Created by FerVP on 24/03/25.
//

import SwiftUI

struct MagnificationGesture: View {
    @State var currentAmout : CGFloat = 0
    @State var lastAmount : CGFloat = 0
    var body: some View {
        
        VStack(spacing : 10){
            HStack{
                Circle().frame(width : 35 , height: 35)
                Text("Swift UI")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height : 300)
           .scaleEffect(1 + currentAmout )

                .gesture(
                    MagnifyGesture()
                        .onChanged{value in
                            currentAmout = 1-value.magnification
    
                        }.onEnded { value in
                            withAnimation(.spring()){
                                
                                currentAmout = 0
                            }

                        }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
        
        }
        
        
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red)
//            .scaleEffect(1 + currentAmout + lastAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged{value in
//                        currentAmout = 1-value.magnification
//                            
//                    }.onEnded { value in
//                        lastAmount = lastAmount + currentAmout
//                        currentAmout = 0
//                        
//                    }
//            )
    }
}

#Preview {
    MagnificationGesture()
}
