//
//  NotificationViewController.swift
//  NotificationContent
//
//  Created by Михаил Иванов on 08.12.2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension, UITextFieldDelegate {
    
    @IBOutlet var label: UILabel?
    @IBOutlet weak var replyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        replyTextField.delegate = self
        setNotificationCategories()
    }
    
    func dismissNotification() {
        extensionContext?.dismissNotificationContentExtension()
    }
    
    func didReceive(_ notification: UNNotification) {
        label?.text = notification.request.content.body
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        
        switch response.actionIdentifier {
        default:
            dismissNotification()
        }
    }
    
    func setNotificationCategories() {
        
        let actions = [
            UNNotificationAction(identifier: "dismiss",  title: "I don't know", options: [.destructive]),
        ]
        
        let category = UNNotificationCategory(identifier: "actions",
                                              actions: actions,
                                              intentIdentifiers: [],
                                              options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
}
