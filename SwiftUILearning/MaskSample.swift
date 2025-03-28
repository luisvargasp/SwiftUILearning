//
//  MaskSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 27/03/25.
//

import SwiftUI

struct MaskSample: View {
    @State var rating : Int = 0
    var body: some View {
        ZStack{
            starsView
                .overlay{
                    overlayView.mask(starsView)
                }
            
        }
    }
    private var overlayView : some View {
        GeometryReader{
            geometry in
            ZStack(alignment:.leading){
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width:geometry.size.width*CGFloat(rating)/5)
                
            }
            
        }.allowsHitTesting(false)
    }
    
    private var starsView :some View {
        
        HStack{
            ForEach(1..<6){
                index in
                
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            rating = index
                        }
                    }
            }
        }
        
    }
}

#Preview {
    MaskSample()
}
