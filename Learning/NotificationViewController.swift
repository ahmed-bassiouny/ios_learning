//
//  NotificationViewController.swift
//  Learning
//
//  Created by NTAM on 1/2/19.
//  Copyright © 2019 NTAM. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationViewController: UIViewController,UNUserNotificationCenterDelegate {

    // manage notifications through UNUserNotificationCenter
    let center = UNUserNotificationCenter.current()
    // There are four notification types
    let options: UNAuthorizationOptions = [.alert, .sound, .badge];


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        center.delegate = self

        requestNotificationPermission()
        center.removeAllPendingNotificationRequests()
    }
    
    
    func requestNotificationPermission()  {
        // You make the actual authorization request using the shared notification center
        center.requestAuthorization(options: options) {
            (granted, error) in
            if granted {
                print("Access")
            }else {
                print("Something went wrong")
            }
        }
    }
    
    func showNotification() {
        // The user can change the notifications settings for your App at any time
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                // Notifications allowed
                self.createNotification()
            }else {
                // Notifications not allowed
                print("Notification not allow")
            }
        }
    }

    func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Don't forget"
        content.body = "Buy some milk"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1,
                                                        repeats: false)
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    
    
    @IBAction func showNotificationButton(_ sender: Any) {
        showNotification()
    }
    
   
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
}
