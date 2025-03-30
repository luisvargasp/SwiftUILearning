//
//  CoreDataSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 29/03/25.
//

import SwiftUI
import CoreData

@Observable class CoreDataViewlModel {
    let container :  NSPersistentContainer
    
    var savedEntities : [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores{
            desc , error in
            if error != nil {
                print("Error loading CORE DATA")
            }else{
                print("Everything is fine")
            }
        }
        fetchFruits()
        
    }
    
    func fetchFruits(){
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities =   try container.viewContext.fetch(request)
        } catch _{
            print("Error fetching data")
        }
        
    }
    func addFruit(name : String){
        let fruit = FruitEntity(context : container.viewContext)
        fruit.name = name
        saveChanges()
    }
    
    func saveChanges(){
        do {
            try  container.viewContext.save()
            
            fetchFruits()
        } catch  let error{
            print("Error saving data : \(error)")
        }
    }
    
    func deleteFruit(at offsets : IndexSet){
        guard let index = offsets.first else { return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveChanges()
        
    }
    
    func updateFruit(fruit : FruitEntity){
        let currenName = fruit.name ?? "NO NAME"
        let newName = "\(currenName) !"
        fruit.name = newName
        saveChanges()
    }
    
}

struct CoreDataSample: View {
    @State var vm : CoreDataViewlModel = .init()
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(vm.savedEntities) { item in
                    Text(item.name ?? "NO NAME")
                        .onTapGesture {
                            vm.updateFruit(fruit: item)
                        }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Fruit", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Fruits")
        }
    }
    
    private func addItem() {
        withAnimation {
            
            vm.addFruit(name: "Fruit \(UUID().uuidString)")
    
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        vm.deleteFruit(at: offsets)
    }
}

#Preview {
    CoreDataSample()
}
