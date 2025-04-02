//
//  CombineSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 1/04/25.
//

import SwiftUI
import Combine
struct Post: Codable , Identifiable{
    let userId: Int
    let id : Int
    let title : String
    let body : String
}

class CombineViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    var cancellables: Set<AnyCancellable> = []
    init(){
        getPosts()
        
    }
    func getPosts() {
        guard   let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
                return
            }
        //
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap {
                (data, response) in
                guard let response = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                guard (200..<300).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink { (completion)
                in
                
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("There was an error \(error)")
                    
                }
                print("\(completion)")
            } receiveValue: { [weak self]result in
                self?.posts=result
            }
            .store(in: &cancellables)
        
    }
}

struct CombineSample: View {
    @StateObject var viewModel: CombineViewModel = .init()
    var body: some View {
        List(viewModel.posts){
            post in
            VStack(alignment : .leading){
                Text(post.title)
                    .font(.headline)
                Text(post.body)
            }
        }
    }
}

#Preview {
    CombineSample()
}
