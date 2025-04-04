//
//  NSCacheSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 2/04/25.
//

import SwiftUI


class CacheManager{
    static let instance = CacheManager()
    var imageCache : NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 //100 mb
        return cache
    }()
    private init(){
        
    }
    func add(image:UIImage,name:String){
        imageCache.setObject(image, forKey: name as NSString)
    }
    func remove(name:String){
        imageCache.removeObject(forKey: name as NSString)
    }
    func get(name:String)->UIImage?{
        return imageCache.object(forKey: name as NSString)
    }
    
    
}
class CacheViewModel: ObservableObject {
    @Published var image : UIImage?=nil
    @Published var cacheImage : UIImage?=nil
    
    
    
    let manager = CacheManager.instance
    let imageName = "sha-256"
    init() {
        getImageFromAssetCatalog( )
        
    }
    func getImageFromAssetCatalog(){
        image = UIImage(named: imageName)
        
    }
    
    func saveToCache(){ 
        guard let image  = image else { return }
        manager.add(image: image, name: imageName)
    }
    func removeFromCache(){
        manager.remove(name: imageName)
    }
    func getFromCache(){
        cacheImage = manager.get(name: imageName)
    }
  
}

struct NSCacheSample: View {
    @StateObject var viewModel: CacheViewModel = .init()
    var body: some View {
        NavigationStack{
            VStack{
                if let image = viewModel.image{
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                
                Button("Save to cache"){
                    viewModel.saveToCache( )
                    
                }
                Button("Delete from cache"){
                    viewModel.removeFromCache( )
                    
                }
                Button("Get from cache"){
                    viewModel.getFromCache( )
                    
                }
                if let cacheImage = viewModel.cacheImage{
                    Image(uiImage: cacheImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                
                Spacer()
            }
            .navigationTitle("NSCache")
        }
    }
}

#Preview {
    NSCacheSample()
}
