//
//  AlignmentGuideSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 4/04/25.
//

import SwiftUI

struct AlignmentGuideSample: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Hello, World!")
                .background(Color.blue)
                .alignmentGuide(.leading){
                    dimensions in
                    dimensions.width
                }
            Text("this is some other text")
                .background(Color.red)
            
        }
        .background(Color.yellow)
    }
}

struct AlignmentChild: View {
    var body: some View {
        VStack(alignment: .leading ,spacing:   20){
            row(title: "First Row")
            row(title: "Second Row")
            row(title: "Third Row",showIcon: true)
            row(title: "Fourth Row")
            row(title: "Fifth Row")
        }.padding(16)
            .background(.white)
            .shadow(radius: 10)
            .padding(40)
        
        
    }
    func row(title : String,showIcon : Bool = false) -> some View {
        HStack(spacing : 10 ){
            if(showIcon){
                
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 30,height: 30)
            }
               
            Text(title)
             
            Spacer()
            
            
        }  // .background(.red)
            .alignmentGuide(.leading){
            dimension in
                showIcon ? 40 : 0
        }
    }
}

#Preview {
    AlignmentChild()
}
