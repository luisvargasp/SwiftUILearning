//
//  SubscribersSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 2/04/25.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count = 0
    var timer : AnyCancellable?
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var textField = ""
    @Published var textIsValid = false
    
    @Published var showButton: Bool = false
    init() {
        setupTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func setupTimer() {
      timer =  Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self ]_ in
                self?.count += 1
                if let count = self?.count,count>=10{
                    self?.timer?.cancel()
                }
            }
    }
    func addTextFieldSubscriber(){
        $textField
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map{ text in
            
            if text.count > 3 {
                 return true
            }else{
                return false
            }
            
        }.sink(receiveValue:    {  [weak self]isValid in
            self?.textIsValid = isValid
        }).store(in: &cancellables)
       /// .assign(to: \.textIsValid , on: self)
    }
    
    func addButtonSubscriber(){
        $textIsValid
            .combineLatest($count)
            .sink{[weak self ] isValid , count  in
                if isValid && count >= 10{
                    self?.showButton = true
                }else{
                    self?.showButton = false
                }
            }.store(in: &cancellables)
    }
}

struct SubscribersSample: View {
    @StateObject private var viewModel = SubscriberViewModel()
    var body: some View {
        VStack{
            Text("\(viewModel.count)")
            Text("\(viewModel.textIsValid.description)")
            TextField("Type something here", text: $viewModel.textField)
                .padding(.horizontal)
                .frame(height : 55)
                .background(.gray)
            Button("Submit"){
            }
                .font(.headline)
                .frame(height : 55)
                .opacity(viewModel.showButton ? 1 : 0.5)
                .disabled(!viewModel.showButton)
            
        }.padding()
    }
}

#Preview {
    SubscribersSample()
}
