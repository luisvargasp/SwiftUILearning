//
//  DragGestureSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 25/03/25.
//

import SwiftUI

struct DragGestureSample: View {
        @State var offset: CGSize = .zero
        var body: some View {
            ZStack {
                VStack{
                    Text("\(offset.width)")
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 500)
                    .offset(offset)
                    .scaleEffect(getScaleAmount())
                    .rotationEffect(Angle(degrees: getRotationAmount()))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.spring()){
                                    offset=value.translation
                                }
                                
                                
                            }.onEnded { value in
                                offset = .zero
                                
                            }
                    )
            }
        }
        func getScaleAmount()->CGFloat
        {
            let max = UIScreen.main.bounds.width / 2
            
            let currentAmout =  abs(offset.width)
            let percentage = currentAmout / max
            return 1.0 - min(percentage,0.5)*0.5
        }
        
        func getRotationAmount() -> Double{
            let max = UIScreen.main.bounds.width / 2
            let current = offset.width
            let percentage = current / max
            let percentageAsDouble = Double(percentage)
            let maxAngle  : Double = 10
            return percentageAsDouble*maxAngle
            
        }
    
}

#Preview {
    DragGestureSample()
}
