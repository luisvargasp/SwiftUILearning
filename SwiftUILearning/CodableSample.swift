//
//  CodableSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 31/03/25.
//

import SwiftUI
enum CodingKeys : String , CodingKey

{
    case id
    case name
    case points
    case premium
}

//Codable = Decodable + Encodable

struct CustomerModel : Identifiable , Codable
{   let id : String
    let name:String
    let points:Int
    let premium:Bool
    
}


class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init(){
        getData()
    }
    func getData(){
        guard  let data = getJSONData() else {
            return
        }
        
        let localData = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if  let dictionary = localData as? [String:Any]{
            let id = dictionary["id"] as? String ?? ""
            let points = dictionary["points"] as? Int ?? 0
            let name = dictionary["name"] as? String ?? ""
            let premium = dictionary["premium"] as? Bool ?? false
            
            customer = CustomerModel(id: id, name: name, points: points, premium: premium)
        }
        
    }
    
    func getJSONData()-> Data?{
        
        let jsonData = try? JSONSerialization.data(withJSONObject: ["id": "123", "name": "John Doe", "points": 100, "premium": true])
        
        return jsonData
        
        
    }
    
    
}

struct CodableSample: View {
    @StateObject private var viewModel = CodableViewModel()
    var body: some View {
        VStack(spacing:20){
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.premium.description)
            }
        }
    }
}

#Preview {
    CodableSample()
}
