//
//  GeometryReaderSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 26/03/25.
//

import SwiftUI

struct GeometryReaderSample: View {
    
    func getPercentage(geometry: GeometryProxy) -> CGFloat {
        let maxDistance = UIScreen.main.bounds.width/2
        
        let currentX=geometry.frame(in: .global).midX
        
        return 1 - (currentX  / maxDistance)
        
    }
    var body: some View {
        
        
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(0..<20){
                    index in
                    
                    GeometryReader{
                        geometry in
                        RoundedRectangle(cornerRadius : 20)
                            .fill(Color.blue)
                            .rotation3DEffect(Angle(degrees:getPercentage(geometry: geometry)*30), axis:   (x: 0, y: 1, z: 0))
                        
                        
                        
                    }.frame(width : 300, height: 250)
                    .padding()
                  
                }
            }
            
        }
//        GeometryReader{
//            geometry in
//            HStack(spacing : 0){
//                Rectangle().fill(Color.red)
//                    .frame(width : geometry.size.width*0.6666)
//                Rectangle().fill(Color.blue)
//                    
//            }.ignoresSafeArea()
//        }
       
    }
}

#Preview {
    GeometryReaderSample()
}
