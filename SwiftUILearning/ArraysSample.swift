//
//  ArraysSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 28/03/25.
//

import SwiftUI

struct UserModel:Identifiable{
    var id = UUID().uuidString
    let name : String
    let points : Int
    let isVerified : Bool

}

@Observable class ArrayViewModel{
    
    var users  : [UserModel] = []
    
    var filteredUsers : [UserModel] = []
    
    init(){
        getUsers()
        updateFilteredUsers()
        
    }
    func getUsers(){
        let user1=UserModel(name: "Ferran", points: 100, isVerified: true)
        
        let user2=UserModel(name: "Pau", points: 200, isVerified: false)
        let user3=UserModel(name: "Xavier", points: 300, isVerified: true)
        let user4=UserModel(name: "David", points: 400, isVerified: false)
        let user5=UserModel(name: "Joan", points: 500, isVerified: true)
        
        
        users.append(contentsOf: [user1,user2,user3,user4,user5])
    }
    func updateFilteredUsers(){
        
        let sortedUsers = users.sorted {
            $0.points > $1.points
        }
        
        let filteredUsers = users.filter {
            $0.isVerified
        }
        
        let transformedUsers =  users.map{
            user in
            UserModel(name: user.name + " transformed", points: user.points*2, isVerified: user.isVerified)
        }
        
        
        
        
        
        
        users = transformedUsers
        
        
        
    }
    
}

struct ArraysSample: View {
    
    @State var vm : ArrayViewModel = .init()
    var body: some View {
        ScrollView{
            VStack(spacing : 20){
                ForEach(vm.users){
                    user in
                    
                    VStack(alignment: .leading){
                        Text(user.name)
                            .font(.headline)
                        HStack{
                            Text(" Points : \(user.points)")
                            Spacer()
                            if user.isVerified{
                                Image(systemName: "flame.fill")
                            }
                            
                        }
                    }.foregroundStyle(.white)
                        .padding()
                        .background(Color.blue)
                        .padding()
                    
                }
            }
        }
    }
}

#Preview {
    ArraysSample()
}
