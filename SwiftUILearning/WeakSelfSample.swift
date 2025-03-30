//
//  WeakSelfSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 30/03/25.
//

import SwiftUI




struct WeakSelfSample: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Navigate"){
                WeakSelfSecondScreen()
            }.navigationTitle(Text("First Screen"))
        }
    }
}
 
struct WeakSelfSecondScreen: View {

    
    @State var viewModel : WeakSelfSecondScreenViewModel = .init()
    var body: some View {
        Text(viewModel.data ?? "No Data")
            .font(.largeTitle)
    }
}

@Observable  class WeakSelfSecondScreenViewModel{
    var data : String? = nil
    init(){
        print("INITIALIZED")
        getData()
    }
    
    deinit {
        print("DEINITIALIZED")
    }
    
    func getData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {[weak self] in
            self?.data = "New Data"
        }
       
        
        print("Fetching Data")
        
    }
    
    
}

#Preview {
    WeakSelfSample()
}
