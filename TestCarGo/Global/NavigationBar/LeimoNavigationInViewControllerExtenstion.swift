//
//  Navigation.swift
//
//  Created by Mahmoud Elmoghazy on 7/8/18.
//  Copyright © 2018 Mahmoud Elmoghazy. All rights reserved.
//

/*
 Copyright (c) 2018, Mahmoud Elmoghazy
 All rights reserved.
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import CoreGraphics

@available(iOS 13.0, *)
extension UIViewController: CAAnimationDelegate {
    
    struct variablesHolder {
        
        static var blurView = UIVisualEffectView()
        static var menuContainer = UIView()
        static var parentView = UIView()
    }
    
    func setupNavigationBar(parentView: UIView) {
        
        variablesHolder.parentView = parentView
        
        // make navigation bar transparnet
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        // end
        
        // make navigation bar with color and icon tint
        
        //        self.navigationController?.navigationBar.barTintColor = Theme.currentTheme.themeWhiteColor
        //        self.navigationController?.navigationBar.tintColor = Theme.currentTheme.themeDarkBlueColor
        
        // end
        
        
        // Add logo in center of navigation with animation
        
        //        let logo = UIImage(named: "NavflyThruLogo")
        //        let imageView = UIImageView(image:logo)
        //        self.navigationItem.titleView = imageView
        //        navigationController?.navigationBar.isTranslucent = true
        //        navigationController?.navigationBar.shadowImage = UIImage()
        //        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //
        //        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromLeft, .curveEaseInOut]
        //        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (_) in
        //            UIView.transition(with: imageView, duration: 1, options: transitionOptions, animations: {
        //            })
        //        }
        
        // end
        
        if SessionManager.appLanguage == "en" {
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
            
        }else {
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
        }
        
        // delete this code once language is setup
        self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
        
        let notification = UIBarButtonItem(image: UIImage(named: "notificationsSharp"),
                                           style: .plain,
                                           target: self,
                                           action: #selector(notification(_:)))
        
        let menu = UIBarButtonItem(image: UIImage(named: "iconMenu"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(openMenu(_:)))
        
        navigationItem.rightBarButtonItems = [menu]
        navigationItem.leftBarButtonItems = [notification]
        
    }
    
    //MARK:- Load views
    
    @objc func notification(_ sender: UIBarButtonItem) {
        moveToView(id: "NotificationVC")
    }
    
    @objc func openMenu(_ openMenu: UIBarButtonItem) {
        
        createMenuContainer()
    }
    
    //MARK:- Create Menu
    
    func createMenuContainer() {
        
        variablesHolder.menuContainer = UIView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: variablesHolder.parentView.bounds.width,
                                                             height: variablesHolder.parentView.bounds.height))
        
        variablesHolder.menuContainer.backgroundColor = .clear
        variablesHolder.menuContainer.tag = 2011
        variablesHolder.menuContainer.transform = CGAffineTransform(translationX: 500, y: 0)
        
        variablesHolder.parentView.addSubview(variablesHolder.menuContainer)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.1,
                       options: [.curveEaseInOut]) {
            
            variablesHolder.menuContainer.transform = CGAffineTransform(translationX: 0, y: 0)
            
        } completion: { (true) in }
        
        
        MenuPopupView()
    }
    
    private func MenuPopupView() {
        
//        loadMenuViewController(storyboardID: "MenuVC",
//                               targetVC: MenuVC(),
//                               container: variablesHolder.menuContainer)
//        
        

    }
    
    // will load views inside home view as childs
    func loadMenuViewController<T: UIViewController>(storyboardID: String,
                                                     targetVC: T,
                                                     container: UIView) {
        
        let VC = UIStoryboard(name: "Main",
                              bundle: nil).instantiateViewController(withIdentifier: storyboardID) as! T
        
        addMenuChildView(viewController: VC, in: container)
    }
    
    private func addMenuChildView(viewController: UIViewController, in view: UIView) {
        
        viewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        viewController.view.frame = view.bounds
        addChild(viewController)
        view.subviews.forEach({ $0.removeFromSuperview() })
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
    }
    // end load view
    
    
    func hideMenu(parentView: UIView) {
        
        if let removable = parentView.viewWithTag(2011) {
            
            UIView.animate(withDuration: 0.5,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            
                            removable.alpha = 0
                            
                           }, completion: { finished in
                            
                            removable.removeFromSuperview()
                            
                           })
        }
    }
    
     func moveToView(id: String) {
        
            
         
         
    }
    
    
    
    
}// end


