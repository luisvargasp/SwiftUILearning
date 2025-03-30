//
//  BackgroundThreads.swift
//  SwiftUILearning
//
//  Created by FerVP on 30/03/25.
//

import SwiftUI

@Observable class BackgroundThreadViewModel {
    
    var data: [String] = []
    
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async{
            let newData = self.download()
            
            print (" Check \(Thread.isMainThread)")
            print (" Check \(Thread.current)")
            self.data = newData
        }
        
    
    }
    
    func download()->[String]{
        var data : [String] = []
        for c in 0..<100{
            data.append("\(c)")
        }
        return data
    }
    
    
    
}

struct BackgroundThreads: View {
    
    @State var viewModel = BackgroundThreadViewModel()
    var body: some View {
        
        ScrollView {
            VStack{
                Text("Load data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData( )
                    }
                
                ForEach(viewModel.data, id: \.self){data in
                    Text(data)
                        .font(.headline)
                        .foregroundStyle(.red)
                        
                    
                }
            }
        }
    }
}

#Preview {
    BackgroundThreads()
}
