//
//  TextFiledExtension.swift
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

extension UITextField {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if SessionManager.appLanguage == "ar" {
            if textAlignment == .natural {
                self.textAlignment = .right
            }
        }else if SessionManager.appLanguage == "en"{
            if textAlignment == .natural {
                self.textAlignment = .left
            }
            
            self.font = UIFont(name: Theme.currentTheme.themeEnglishFontName, size: (self.font?.pointSize)!)
        }
    }
    
    func setTextFieldWithRadiusAndRightLeftViews(radius: CGFloat,
                                                 leftImage: String?,
                                                 rightImage: String?,
                                                 borderWidth: CGFloat?,
                                                 borderColor: UIColor?,
                                                 textColor: UIColor?,
                                                 backgroundColor: UIColor?) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        self.layer.borderWidth = borderWidth ?? 1
        self.layer.cornerRadius = radius
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor?.cgColor
        self.textColor = textColor
        
        let padding = 50
        let size = 20
        let noViewWidth = 50
        let noViewHeight = 50
        
        //Left view
        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: noViewWidth, height: noViewHeight))
        if leftImage != nil {
            
            leftOuterView.frame = CGRect(x: 0, y: 0, width: padding, height: size)
            let leftIconView  = UIImageView(frame: CGRect(x: 15, y: 0, width: size, height: size))
            leftIconView.image = UIImage(named: leftImage ?? "")
            leftIconView.contentMode = .scaleAspectFit
            leftOuterView.addSubview(leftIconView)
        }
        
        leftView = leftOuterView
        leftViewMode = .always
        
        //Right View
        let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: noViewWidth, height: noViewHeight))
        if rightImage != nil {
            
            rightOuterView.frame = CGRect(x: 0, y: 0, width: padding, height: size)
            let rightIconView  = UIImageView(frame: CGRect(x: 15, y: 0, width: size, height: size))
            rightIconView.image = UIImage(named: rightImage ?? "")
            rightIconView.contentMode = .center
            rightOuterView.addSubview(rightIconView)
        }
        
        rightView = rightOuterView
        rightViewMode = .always
        
        if leftImage == nil && rightImage == nil {
            
            leftOuterView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
            rightOuterView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        }
    }
    
    func selectTextFeildStyleShadow()
    {
        self.layer.shadowColor = Theme.currentTheme.themeBlueColor.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width:-1, height:1)
    }
    
    
    func unselectTextFeildStyleShadow()
    {
        self.layer.shadowColor = Theme.currentTheme.themeWhiteColor.cgColor
    }
    
    
    func setTextFieldWithRadiusAndRightLeftViewsWithShadow(radius: CGFloat,
                                                 leftImage: String?,
                                                 rightImage: String?,
                                                 borderWidth: CGFloat?,
                                                 borderColor: UIColor?,
                                                 textColor: UIColor?,
                                                 backgroundColor: UIColor?) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        self.layer.borderWidth = borderWidth ?? 1
        self.layer.cornerRadius = radius
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor?.cgColor
        self.textColor = textColor
        
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: -3, height: 5)
        self.layer.shadowColor = Theme.currentTheme.themeBlueColor.cgColor
        
        let padding = 50
        let size = 20
        let noViewWidth = 50
        let noViewHeight = 50
        
        //Left view
        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: noViewWidth, height: noViewHeight))
        if leftImage != nil {
            
            leftOuterView.frame = CGRect(x: 0, y: 0, width: padding, height: size)
            let leftIconView  = UIImageView(frame: CGRect(x: 15, y: 0, width: size, height: size))
            leftIconView.image = UIImage(named: leftImage ?? "")
            leftIconView.contentMode = .scaleAspectFit
            leftOuterView.addSubview(leftIconView)
        }
        
        leftView = leftOuterView
        leftViewMode = .always
        
        //Right View
        let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: noViewWidth, height: noViewHeight))
        if rightImage != nil {
            
            rightOuterView.frame = CGRect(x: 0, y: 0, width: padding, height: size)
            let rightIconView  = UIImageView(frame: CGRect(x: 15, y: 0, width: size, height: size))
            rightIconView.image = UIImage(named: rightImage ?? "")
            rightIconView.contentMode = .center
            rightOuterView.addSubview(rightIconView)
        }
        
        rightView = rightOuterView
        rightViewMode = .always
        
        if leftImage == nil && rightImage == nil {
            
            leftOuterView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
            rightOuterView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        }
    }
    
    func setTextFieldAsSearch(radius: CGFloat, leftImage: String?, rightImage: String?) {
        
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.layer.borderWidth = 0
        self.layer.cornerRadius = radius
        self.backgroundColor = Theme.currentTheme.themeLightGrayColor
        
        //Left view
        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        if leftImage != nil {
            
            let leftIconView  = UIImageView(frame: CGRect(x: 5, y: 0, width: 15, height: 15))
            leftIconView.image = UIImage(named: leftImage ?? "")
            leftIconView.contentMode = .scaleAspectFit
            leftOuterView.addSubview(leftIconView)
        }
        
        leftView = leftOuterView
        leftViewMode = .always
        
        //Right View
        let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
        if rightImage != nil {
            
            let rightIconView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
            rightIconView.image = UIImage(named: rightImage ?? "")
            rightIconView.contentMode = .scaleAspectFit
            rightOuterView.addSubview(rightIconView)
        }
        
        rightView = rightOuterView
        rightViewMode = .always
    }
    
    func setTextFieldWithButtonRightAndLeft(radius: CGFloat,
                                            buttonImageOrTitleRight: String?,
                                            buttonImageOrTitleLeft: String?,
                                            borderWidth: CGFloat?,
                                            borderColor: UIColor?,
                                            isButtonIcon: Bool,
                                            rightActionSelector: Selector?,
                                            leftActionSelector: Selector?,
                                            type: String?) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        self.layer.borderWidth = borderWidth ?? 1
        self.layer.cornerRadius = radius
        self.backgroundColor = .clear
        self.layer.borderColor = borderColor?.cgColor
        self.textColor = Theme.currentTheme.themeGrayColor
        
        let widthSize = 50
        let heightSize = 50
        
        if buttonImageOrTitleLeft == nil && buttonImageOrTitleRight == nil {
           // let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
            let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
            
//            leftView = leftOuterView
//            leftViewMode = .always
            
            rightView = rightOuterView
            rightViewMode = .always
            return
        }
        
        //Left view
//        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: widthSize, height: heightSize))
//
//        if buttonImageOrTitleLeft != nil {
//            leftOuterView.frame = CGRect(x: 0, y: 0, width: widthSize, height: heightSize)
//            let leftButton = UIButton(frame: CGRect(x: 5, y: 5, width: widthSize - 10, height: heightSize - 10))
//
//            if isButtonIcon == true {
//                leftButton.setImage(UIImage(named: buttonImageOrTitleLeft ?? ""), for: .normal)
//            }else {
//                leftButton.setTitle(buttonImageOrTitleLeft, for: .normal)
//            }
//
//            if leftActionSelector != nil {
//                leftButton.accessibilityIdentifier = type ?? ""
//                leftButton.addTarget(target, action: leftActionSelector!, for: .touchUpInside)
//            }
//
//          //  leftOuterView.addSubview(leftButton)
//        }
//
//        leftView = leftOuterView
//        leftViewMode = .always
        
        //Right View
        let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: widthSize, height: heightSize))
        
        if buttonImageOrTitleRight != nil {
            rightOuterView.frame = CGRect(x: 0, y: 0, width: widthSize, height: heightSize)
            let rightButton = UIButton(frame: CGRect(x: 5, y: 5, width: widthSize - 10, height: heightSize - 10))
            
            if isButtonIcon == true {
                rightButton.setImage(UIImage(named: buttonImageOrTitleRight ?? ""), for: .normal)
            }else {
                
                rightButton.setTitle(buttonImageOrTitleRight, for: .normal)
            }
            
            if rightActionSelector != nil {
                rightButton.accessibilityIdentifier = type ?? ""
                rightButton.addTarget(target, action: rightActionSelector!, for: .touchUpInside)
            }
            
            rightOuterView.addSubview(rightButton)
        }
        
        rightView = rightOuterView
        rightViewMode = .always
    }
    
    func disableAutoFill() {
        
        if #available(iOS 12, *) {
            textContentType = .oneTimeCode
        } else {
            textContentType = .init(rawValue: "")
        }
    }
    
    func typeOn(string: String, typeInterval: TimeInterval) {
        
        let characterArray = string.characterArray
        var characterIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: typeInterval, repeats: true) { (timer) in
            
            while characterArray[characterIndex] == " " {
                self.text! += " "
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
                                self.text! += String(characterArray[characterIndex])
                              })
            
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
                self.delegate?.textFieldDidEndEditing?(self)
            }
        }
    }
    
    
}// end
