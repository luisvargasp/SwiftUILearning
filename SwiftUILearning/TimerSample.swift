//
//  TimerSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 1/04/25.
//

import SwiftUI


struct TimerSample: View {
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
    
    @State var currentTime: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    
    //countDown
    
    @State var count : Int = 10
    
    @State var finishedText : String? = nil
    
    //count down to date
    @State var timeRemaing : String = ""
    
    
    //animation counter
    @State var animationCount : Int = 0
    
    let futureDate : Date = Calendar.current.date(byAdding: .day , value: 1, to: Date()) ?? Date()
    
    
    func updateTimeRemaining(){
        let remainingTime = Calendar.current.dateComponents([.day,.hour,.minute,.second], from: Date(), to: futureDate)
        
        let days = remainingTime.day ?? 0
        let hours = remainingTime.hour ?? 0
        let minutes = remainingTime.minute ?? 0
        let seconds = remainingTime.second ?? 0
        
        timeRemaing = "\(days):\(hours):\(minutes):\(seconds)"
        
    }
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [.blue, .red],center : .center,
                           startRadius: 5,endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
               // Text(dateFormatter.string(from: currentTime))
               // Text(finishedText ?? "\(count)")
                Text(timeRemaing)
                    .font(.system(size: 100, weight: .bold,design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .padding(.horizontal,20)
                
                HStack(spacing : 15){
                    Circle()
                        .offset(y:animationCount == 1 ? -20:0)
                    Circle()
                        .offset(y:animationCount == 2 ? -20:0)
                    Circle()
                        .offset(y:animationCount == 3 ? -20:0)
                }.frame(width : 200)
                .foregroundStyle(.white)
            }
        }
        .onReceive(timer){ value in
//            currentTime=value
//            if count <= 1 {
//                finishedText = "Finished"
//            }else{
//                count -= 1
//            }
            updateTimeRemaining()
            withAnimation(.easeInOut(duration: 0.4)){
                
                animationCount =  animationCount == 3  ? 0 : animationCount + 1
            }
            

            
        }
    }
}

#Preview {
    TimerSample()
}
