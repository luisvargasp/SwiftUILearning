//
//  DownloadWithScaping.swift
//  SwiftUILearning
//
//  Created by FerVP on 31/03/25.
//

import SwiftUI

struct PostModel: Codable , Identifiable{
    let userId: Int
    let id : Int
    let title : String
    let body : String
}

class DownloadWithScapingViewModel: ObservableObject {
    @Published var posts : [PostModel] = []
    init(){
        getPosts()
        
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else {return}
        downloadData(fromURL: url){
            if let data = $0 {
                guard let post = try? JSONDecoder().decode([PostModel].self, from: data) else {
                    print("Error decoding")
                    return
                }
                DispatchQueue.main.async {[weak self] in
                    self?.posts = post
                }
            }else{
                print("No data")
            }
        }
        
    }
    func downloadData(fromURL  url : URL ,completion : @escaping (_ data : Data?) -> Void)  {
        
        URLSession.shared.dataTask(with: url)
            {data,response,error in
                guard let data = data,
                 error == nil,
                 let response = response as? HTTPURLResponse,
                 response.statusCode >= 200 && response.statusCode < 300
                else { completion (nil);
                    return }
                completion(data)
        
            }.resume()
    }
    
}

struct DownloadWithScaping: View {
    @StateObject var viewModel: DownloadWithScapingViewModel = .init()
    var body: some View {
        List(viewModel.posts, id: \.id) { post in
            VStack(alignment : .leading) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    DownloadWithScaping()
}
