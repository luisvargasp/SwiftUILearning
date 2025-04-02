//
//  FileManagerSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 2/04/25.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    init(){
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded(){
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?
            .appendingPathComponent("swiftui-learning")
            .path
        else {
            return
        }
        if(FileManager.default.fileExists(atPath: path)){
            do {
               try  FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
            } catch let error as NSError {
                print(error)
            }
        }
        
        
        
    }
    
    func saveImage(image:UIImage,name : String){
        
        guard
            let data = image.pngData() ,
        let path = getPathForImage(name: name)
            
        else { return
            }
        
      
        
        do{
            try data.write(to: path)
            print("Success saving")
        }catch let error as NSError{
            print(error)
        }
        
        print(path)

    }
    
    func getPathForImage(name : String)->URL?{
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?
            //.appendingPathComponent( "swiftui-learning")
            .appendingPathComponent("\(name).png")
        else{
            return nil
        }
        return path
        
    }
    func getImage(name:String)->UIImage?{
        guard let path = getPathForImage(name: name)?.path(),
        FileManager.default.fileExists(atPath: path)
         else {
            return nil
        }
        
        return UIImage(contentsOfFile: path)
              
    }
    func deleteImage(name:String){
        guard let path = getPathForImage(name: name)?.path()
        else {
            return
        }
        do{
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting")
        }catch let error as NSError{
            print(error)
        }
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image : UIImage?
    
    let manager = LocalFileManager.instance
    init() {
       //getImageFromAssetsFolder()
        getImageFromFM()
    }
    func getImageFromAssetsFolder() {
        image = UIImage(named: "sha-256")
    }
    func saveImage(){
        guard let image = image else { return }
        manager.saveImage(image: image, name: "sha-256")
    }
    
    func getImageFromFM(){
        image = manager.getImage(name: "sha-256")
    }
    func deleteImage(){
        manager.deleteImage(name: "sha-256")
    }
}

struct FileManagerSample: View {
    
    @StateObject var viewModel = FileManagerViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .clipped()
                }
                Button("Save to FM"){
                    viewModel.saveImage()
                   // viewModel.deleteImage()
                    
                    
                }
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .background(Color.blue)
                .clipShape(.buttonBorder)
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
        
    }
}

#Preview {
    FileManagerSample()
}
