//
//  LocalNotificationSample.swift
//  SwiftUILearning
//
//  Created by FerVP on 27/03/25.
//

import SwiftUI
import UserNotifications
import CoreLocation
class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let instance = NotificationManager()
    
    func requestPermission() {
        let options : UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            if granted {
                print("success")
                
            }
            if let error = error {
                print("Error : \(error)")
            }
            
            
        }
        
    }
    
    func requestNotification(){
        let content = UNMutableNotificationContent()
        content.title = "First Notification"
        content.subtitle="This is a test notification"
        content.sound = .default
        content.badge = 2
        
        
           //triger : time ,calendar ,location
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval:5.0 , repeats: false)
        
        
        
//        var  dateComponents = DateComponents()
//        dateComponents.hour = 19
//        dateComponents.minute = 42
//        //dateComponents.weekday 6
//        let trigger = UNCalendarNotificationTrigger(dateMatching:dateComponents
//                                                        
//                                                        , repeats: false)
        
        
        
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00, longitude: 50.00)
        
        let region = CLCircularRegion(center: coordinates, radius: 50, identifier: UUID().uuidString)
        
        region.notifyOnEntry = true
        region.notifyOnExit = true
        
        let trigger = UNLocationNotificationTrigger(region:region , repeats: false)
        
        
        
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger:
                                                trigger)
        
        UNUserNotificationCenter.current().add(request)
   
        
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
}

struct LocalNotificationSample: View {
    var body: some View {
        VStack(spacing : 40){
            
            Button("Request Permission"){
                NotificationManager.instance.requestPermission()
                
                
            }
            Button("Send Notification"){
                NotificationManager.instance.requestNotification()
                
                
            }
            
        }.onAppear{
            //UIApplication.shared.applicationIconBadgeNumber = 0
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    LocalNotificationSample()
}
