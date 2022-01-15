//
//  ViewControllerExtension.swift
//  L7M
//
//  Created by Mahmoud Elmoghazy on 9/7/20.
//  Copyright © 2020 Mawaqaa. All rights reserved.
//

/*
 Copyright (c) 2020, Mahmoud Elmoghazy
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

import Foundation
import UIKit

extension UIViewController {
    
    func globalAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: customeTextLocalization(key: title),
                                      message: customeTextLocalization(key: message),
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: customeTextLocalization(key: "Yes"),
                                     style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func globaleAlertSheet(title: String? = nil, message:String? = nil) {
        
        let alertSheet = UIAlertController(title: customeTextLocalization(key: title ?? ""),
                                           message: customeTextLocalization(key: message ?? ""),
                                           preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet)
        
        let okAction = UIAlertAction(title: customeTextLocalization(key: "Ok"), style: .default, handler: nil)
        
        alertSheet.addAction(okAction)
        
        self.present(alertSheet, animated: true, completion: nil)
    }
    
    func globaleAlertWithActions(title: String, message: String, options: String..., completion: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: customeTextLocalization(key: title),
                                                message: customeTextLocalization(key: message),
                                                preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet)
        
        for (index, option) in options.enumerated() {
            
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(options[index])
            }))
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // please call this method in view did appear
    func setStatusBarColor() {
        
        if #available(iOS 13.0, *) {
            
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor =  Theme.currentTheme.themeBlueColor  //UIColor(red: 245/255, green: 195/255, blue: 12/255, alpha: 1.0) /* #f8ba0c */ //
            UIApplication.shared.keyWindow?.addSubview(statusBar)
            
        } else {
            
            UIApplication.shared.statusBarView?.backgroundColor = Theme.currentTheme.themeWhiteColor
        }
    }
    
    func setStatusBarColor2() {
        
        if #available(iOS 13.0, *) {
            
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor =  Theme.currentTheme.themeWhiteColor  //UIColor(red: 245/255, green: 195/255, blue: 12/255, alpha: 1.0) /* #f8ba0c */ //
            UIApplication.shared.keyWindow?.addSubview(statusBar)
            
        } else {
            
            UIApplication.shared.statusBarView?.backgroundColor = Theme.currentTheme.themeWhiteColor
        }
    }
    
    
}

//MARK:- UI Application
extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
