//
//  LabelExtension.swift
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

extension UILabel {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if SessionManager.appLanguage == "ar" {
            if textAlignment == .natural {
                //self.textAlignment = .right
            }
            
        }else if SessionManager.appLanguage == "en" {
            if textAlignment == .natural {
                self.textAlignment = .left
            }
            
            //self.font = UIFont(name: Theme.currentTheme.themeEnglishFontName, size: (self.font?.pointSize)!)
        }
    }
    
    
    func setLabelRoundedCorner(radius: CGFloat, borderWidth: CGFloat,borderColor: UIColor? ,backGroundColor: UIColor, textColor: UIColor, isShadow: Bool) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.backgroundColor = backGroundColor.cgColor
        self.layer.borderColor = borderColor?.cgColor
        self.textColor = textColor
        self.textAlignment = .center
        self.layer.opacity = 1
        self.layoutIfNeeded()
        self.adjustsFontSizeToFitWidth = true
        
        self.layoutIfNeeded()
        
        if isShadow == true {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 3.0
        }
        
    }
    
    func noDataFoundLabel () {
        
        self.text = customeTextLocalization(key: "No Items found")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    
    func typeOn(string: String, typeInterval: TimeInterval) {
        
        let characterArray = string.characterArray
        var characterIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: typeInterval, repeats: true) { (timer) in
            
            while characterArray[characterIndex] == " " {
                self.text?.append(" ")
                characterIndex += 1
                if characterIndex == characterArray.count {
                    timer.invalidate()
                    return
                }
            }
            
            UIView.transition(with: self,
                              duration: typeInterval,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.text?.append(characterArray[characterIndex])
                              })
            
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
                self.endEditing(true)
            }
        }
    }
    
    func autoFit(scale : CGFloat) {
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = scale
    }
    
}


class MyLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: 2,
                                                       left: 2,
                                                       bottom: 2,
                                                       right: 2)))
    }
    
}
