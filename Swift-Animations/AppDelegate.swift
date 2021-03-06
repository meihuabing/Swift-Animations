//
//  AppDelegate.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/4.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        /*
         
         Swift version Animations - https://github.com/YouXianMing/Swift-Animations
         
         Lateast no warning version : Xcode Version 7.3.1 (7D1014)
         
         QQ    705786299
         Email YouXianMing1987@126.com
         
         http://www.cnblogs.com/YouXianMing/
         https://github.com/YouXianMing
         https://github.com/YouXianMing/YoCelsius
         
         AppStore : https://itunes.apple.com/us/app/yocelsius/id967721892?l=zh&ls=1&mt=8
         Video    : http://my.jikexueyuan.com/YouXianMing/record/
         
         */
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if let window = window {
            
            window.backgroundColor    = UIColor.whiteColor()
            let controller            = AnimationsListViewController()
            let rootViewController    = RootNavigationViewController(rootViewController: controller, hideTabBar: true)
            window.rootViewController = rootViewController
            window.makeKeyWindow()
        }
        
        return true
    }
}

