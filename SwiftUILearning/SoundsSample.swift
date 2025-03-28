//
//  SoundsSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 27/03/25.
//

import SwiftUI
import AVKit
class SoundManager {
    static let instance = SoundManager()
    private init(){}
    
    var player : AVAudioPlayer?
    func playSound(name:String){
        
        guard  let url = Bundle.main.url(forResource: name,  withExtension: "mp3") else { return }
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch  {
            print("error playing sound \(error)" ) 
        }

        
    }
    
    
}

struct SoundsSample: View {
     
    var soundManager = SoundManager.instance
    var body: some View {
        VStack(spacing : 40){
            Button("Play sound 1"){
                soundManager.playSound(name: "deck")
                
            }
            Button("Play sound 2"){
                
            }
        }
    }
}

#Preview {
    SoundsSample()
}
