//
//  OnePressedGesture.swift
//  SwiftUILearning
//
//  Created by FerVP on 24/03/25.
//

import SwiftUI

struct LongPressGesture: View {
    @State var isComplete : Bool = false
    @State var isFinished : Bool = false
    var body: some View {
        
        VStack{
            Rectangle()
                .fill( isFinished ? Color.green : Color.blue)
                .frame(maxWidth : isComplete ?  .infinity : 0)
                .frame(maxWidth: .infinity,alignment: .leading)
                .frame(height : 55)
                .background(Color.gray)
            
            HStack {
                Text("Click Here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 3, maximumDistance: 50){ (isPressing) in
                        
                        // start of press -> min duration
                        if(isPressing){
                            withAnimation(.easeInOut(duration : 3.0)){
                                isComplete = true
                                
                            }
                        }
                        else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                if(!isFinished){
                                    withAnimation(.easeInOut){
                                        isComplete = false
                                        
                                    }
                                    
                                }
                            }
                        }
                        
                    } perform :{
                        withAnimation(.easeInOut){
                            isFinished = true
                        }
                        
                    }
                
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isFinished = false
                    }
                    
            }
        }
//        Text(isComplete ? "Completed" : "NOT Completed")
//            .padding()
//            .padding(.horizontal)
//            .background( isComplete ? Color.green :  Color.gray)
//            .clipShape(.rect(cornerRadius: 10))
//            .onTapGesture {
//               // isComplete.toggle()
//            }
//            .onLongPressGesture(minimumDuration: 1,maximumDistance: 1) {
//                isComplete.toggle()
//            }
    
    }
}

#Preview {
    LongPressGesture()
}
