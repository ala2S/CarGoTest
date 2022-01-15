//
//  CustomTabBar.swift
//
//  Created by Mahmoud Elmoghazy on 9/5/18.
//  mahmoud.abdallah@outlook.com
//  Copyright © 2019 Mahmoud Elmoghazy. All rights reserved.
//

import UIKit

class LeimoCustomTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SessionManager.load()
        setUpTabBar()
        
        self.tabBar.tintColor = Theme.currentTheme.themeBlueColor
        self.tabBar.barTintColor = .white //Theme.currentTheme.themeGreenButtonsColor
        self.tabBar.unselectedItemTintColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        SessionManager.load()
    }
    
    func setUpTabBar() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (_) in
            
            //            if SessionManager.isLogin == "true"{
            //                self.tabBar.items?[4].isEnabled = true
            //            }else{
            //                self.tabBar.items?[4].isEnabled = false
            //            }
            
            self.tabBar.items?[0].image = UIImage(named: "icons8-Home")
           // self.tabBar.items?[0].title = customeTextLocalization(key: "Home")
            
            self.tabBar.items?[1].image = UIImage(named: "icons8-search")
            //self.tabBar.items?[1].title = customeTextLocalization(key: "My Orders")
            
            self.tabBar.items?[2].image = UIImage(named: "NotificationIcon")
            //self.tabBar.items?[2].title = customeTextLocalization(key: "Profile")
            
            self.tabBar.items?[3].image = UIImage(named: "icons8-mail-2")
           // self.tabBar.items?[3].title = customeTextLocalization(key: "Setting")
            
//            self.tabBar.items?[4].image = UIImage(named: "chatTabIcon")
//            self.tabBar.items?[4].title = customeTextLocalization(key: "Live Chat")
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view , let toView = viewController.view else {
            return false // Make sure you want this as false
        }
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if (self.selectedViewController?.isKind(of: UINavigationController.self))!
        {
            let nav = self.selectedViewController as! UINavigationController
            nav.popToRootViewController(animated: false)
            if   ((self.tabBar.items?[1]) != nil)
            {
                let nav = self.selectedViewController as! UINavigationController
                nav.popToRootViewController(animated: false)
            }
                    
        }
    }
    
    func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        // real device
        print(UIScreen.main.nativeBounds.height)
        
        if UIDevice().userInterfaceIdiom == .phone {
            
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C, SE")
                
            case 1334:
                print("iPhone 6 , 6s, 7,  8")
                // y = 16
                let rect: CGRect = CGRect(x: 0, y: 16, width: size.width, height: 48)
                UIGraphicsBeginImageContextWithOptions(size, false, 0)
                color.setFill()
                UIRectFill(rect)
                let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                return image
                
            case 1920:
                print("iPhone 6 Plus, 6s Plus, 7 Plus, 8 Plus")
                // y = 15
                let rect: CGRect = CGRect(x: 0, y: 15, width: size.width, height: 48)
                UIGraphicsBeginImageContextWithOptions(size, false, 0)
                color.setFill()
                UIRectFill(rect)
                let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                return image
                
            case 2436:
                print("iPhone X")
                // y = 0
                let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: 50)
                UIGraphicsBeginImageContextWithOptions(size, false, 0)
                color.setFill()
                UIRectFill(rect)
                let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                return image
                
            case 2048:
                print("iPad Pro (9.7-inch), iPad Air 2, iPad Mini 4")
                
                let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: 60)
                UIGraphicsBeginImageContextWithOptions(size, false, 0)
                color.setFill()
                UIRectFill(rect)
                let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
                UIGraphicsEndImageContext()
                return image
                
            case 1668:
                print("iPad Pro 10.5-inch")
            case 2732:
                print("iPad Pro (12.9-inch), iPad Pro 12.9-inch (2nd generation)")
            default:
                print("unknown")
            }
        }
        
        // simulator
        let modelName = UIDevice.modelName
        if modelName == "Simulator iPhone X"{
            let rect: CGRect = CGRect(x: 0, y: -31, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            color.setFill()
            UIRectFill(rect)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return image
        }else{
            let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            color.setFill()
            UIRectFill(rect)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return image
        }
    }
    
    
}// end

