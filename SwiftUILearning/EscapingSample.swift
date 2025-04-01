//
//  EscapingSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 30/03/25.
//

import SwiftUI

@Observable class EscapingViewModel {
    
    
    var text = "Hello"
    func getData()  {
         downloadData2(){ [weak self]  data in
            self?.text = data
        }
       
        
    }
    func downloadData() ->String{
            return "New data"
    
    }
    func downloadData2(completion:  @escaping (_ data : String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("Async task completed")
            completion("New data2")
            
        }
    }
    
    func downloadData3(completion:  @escaping (_ data : DownloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("Async task completed")
            completion(DownloadResult(data: "NewDataResult"))
            
        }
    }
    func downloadData4(completion:  @escaping DownloadCompletionHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("Async task completed")
            completion(DownloadResult(data: "NewDataResult"))
            
        }
    }
    
    func doSomething ( data : String){
        print (data)
    }
    

    
}

struct DownloadResult{
    let data : String
}

typealias DownloadCompletionHandler = (_ data : DownloadResult) -> Void

struct EscapingSample: View {
    @State var viewModel: EscapingViewModel = .init()
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

#Preview {
    EscapingSample()
}
