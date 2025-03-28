//
//  HapticSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 27/03/25.
//

import SwiftUI
class HapticManager {
    static let instance = HapticManager()
    
    func notification(type : UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
        
        
    }
    func impact(style : UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
        
    }
}

struct HapticSample: View {
    let hapticManager = HapticManager.instance
    var body: some View {
        
        VStack{
            Button("Notification"){
                hapticManager.notification(type: .success)
                
            }
            Button("Impact"){
                hapticManager.impact(style: .heavy)
            }
        }
       
    }
}

#Preview {
    HapticSample()
}
