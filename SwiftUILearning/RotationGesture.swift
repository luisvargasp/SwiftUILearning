//
//  RotationGesture.swift
//  SwiftUILearning
//
//  Created by FerVP on 24/03/25.
//

import SwiftUI

struct RotationGestureTest: View {
    @State var angle : Angle = .zero
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.title)
            .fontWeight(.semibold)
            .padding(50)
            .foregroundStyle(.white)
            .background(.blue)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged{value in
                        angle = value
                        
                    }.onEnded{value in
                        withAnimation(.spring){
                            angle = .zero
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureTest()
}
