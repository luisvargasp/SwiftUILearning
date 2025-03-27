//
//  DragGesstureSample2.swift
//  SwiftUILearning
//
//  Created by FerVP on 25/03/25.
//

import SwiftUI

struct DragGesstureSample2: View {
    @State var currentDragOffsetY : CGFloat = 0
    @State var endingOffsetY : CGFloat = 0
    
    @State var offsetY : CGFloat = UIScreen.main.bounds.height*0.85
    var body: some View {
        
        
        ZStack{
            Color.green.ignoresSafeArea()
            
            VStack(spacing : 20 ){
                Image(systemName: "chevron.up")
                    .padding(.top)
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.semibold)
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                Text("This a drag gesture sample")
                    .multilineTextAlignment(.center)
                
                Text("Create an account")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                                
                Spacer()
                  
                
                
            }.frame(maxWidth: .infinity)
            
            .background(.white)
            .padding(1)
            .ignoresSafeArea(edges : .bottom)
            .offset(y:offsetY)
            .offset(y:currentDragOffsetY)
            .offset(y:endingOffsetY)
            .gesture(
                DragGesture().onChanged { value in
                    withAnimation(.spring()){
                        currentDragOffsetY = value.translation.height

                    }

                
                }.onEnded { value in
                   
                    withAnimation(.spring()){
                        if(currentDragOffsetY < -150){
                          endingOffsetY = -offsetY
                                               
                        }else if(endingOffsetY != 0 && currentDragOffsetY>150){
                            
                            endingOffsetY = 0
                            
                            
                        }
                            currentDragOffsetY = 0
                    }
                    
               }
           )
         
            
        }
    }
}

#Preview {
    DragGesstureSample2()
}
