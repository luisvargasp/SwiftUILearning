//
//  TypedAliasSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 30/03/25.
//

import SwiftUI

struct Movie{
    let title : String
    let director : String
    let count : Int
}
typealias TVShow = Movie

struct TypedAliasSample: View {
    @State var movie = Movie(title: "The Shawshank Redemption", director: "Frank Darabont", count: 142)
    
    @State var tvShow : TVShow = .init(title: "Friends", director: "Unknown", count: 142)
    var body: some View {
        VStack{
            Text(movie.title)
                .font(.headline)
            Text(movie.director)
            Text("\(movie.count) minutes")
        }
    }
}

#Preview {
    TypedAliasSample()
}
