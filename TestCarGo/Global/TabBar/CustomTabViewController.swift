//
//  CustomTabViewController.swift
//  4Deals
//
//  Created by alaa on 08/12/2021.
//

import UIKit

class CustomTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
           super.viewDidLoad()
       
        delegate = self

           if let myTabbar = tabBar as? STTabbar {
               myTabbar.centerButtonActionHandler = {
                   print("Center Button Tapped")
               }
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
        
        print("store 1 ")

        if (self.selectedViewController?.isKind(of: UINavigationController.self))!
        {
            let nav = self.selectedViewController as! UINavigationController
            nav.popToRootViewController(animated: false)
            
            
            if   self.tabBar.items?[1] == item
            {
            
                //tabBarController?.selectedIndex = 0
            
                print("store")
            }
                    
        }
    }
    

}
