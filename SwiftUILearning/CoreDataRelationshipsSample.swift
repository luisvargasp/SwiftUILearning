//
//  CoreDataRelationshipsSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 29/03/25.
//

import SwiftUI
import CoreData
class CoredataManager {
    static let instance = CoredataManager()
    let container :  NSPersistentContainer
    let context : NSManagedObjectContext
    
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores{
            desc , error in
            if error != nil {
                print("Error loading CORE DATA")
            }else{
                print("Everything is fine")
            }
        }
        context = container.viewContext
        
        
    }
    
    func save(){
        do{
            try context.save()
            print("Saved successfully")
        } catch let error  {
            print("Error saving data \(error.localizedDescription)")
            
        }
    }
    
    
}


@Observable class  CoredataRelationshipViewModel{
    
    let manager : CoredataManager = .instance
    
    var businesses : [BusinessEntity] = []
    init(){
        fetchBusinesses()
    }
    
    func addBusiness(){
        let businessEntity = BusinessEntity(context: manager.context)
        businessEntity.name = "Apple \(Int.random(in: 1...100))"
  
        manager.save()
        fetchBusinesses()
    }
    func fetchBusinesses(){
        let request : NSFetchRequest = BusinessEntity.fetchRequest()
        do{
            businesses  = try manager.context.fetch(request)
            businesses.forEach { print("\($0.name ?? "No Name")") }
            
         
            print(" total businesses \(businesses.count)")
        } catch  {
            print("Error fetching data \(error.localizedDescription)")
        }
    }
}

struct CoreDataRelationshipsSample: View {
    
    @State var viewModel : CoredataRelationshipViewModel = .init()
    
    var body: some View {
        NavigationStack{
           
                    Text("Businesses")

                    Button("Add Business"){
                        viewModel.addBusiness()
                    }
                    
                    List{
                        ForEach(viewModel.businesses){ business in
                            Text(business.name ?? "No name")
                                .foregroundStyle(.blue)
                        }
                    }
            
        }
    }
}

#Preview {
    CoreDataRelationshipsSample()
}
