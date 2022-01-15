//
//  ButtonExtenstion.swift
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

extension UIButton{
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if SessionManager.appLanguage == "ar" {
            
        }else if SessionManager.appLanguage == "en"{
            
//            self.titleLabel?.font = UIFont(name: Theme.currentTheme.themeBoldEnglishFontName,
//                                           size: (self.titleLabel?.font.pointSize)!)
        }
    }
    
    //MARK:- button
    
   
    
    func setButtonRoundedCorner(radius: CGFloat,
                                borderWidth: CGFloat,
                                borderColor: UIColor?,
                                backGroundColor: UIColor,
                                textColor: UIColor,
                                isShadow: Bool) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.backgroundColor = backGroundColor.cgColor
        self.layer.borderColor = borderColor?.cgColor
        self.tintColor = textColor
        self.layer.opacity = 1
        
        if isShadow == true {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 3.0
        }
    }
    
    func setButtonSelectedRoundedCorner(corners:UIRectCorner,
                                        radius: CGFloat,
                                        borderWidth: CGFloat,
                                        borderColor: UIColor?,
                                        backGroundColor: UIColor,
                                        textColor: UIColor,
                                        isShadow: Bool) {
        
        
        //self.setTitleColor(textColor, for: .normal)
        
        
//        let roundedMaskPath = UIBezierPath(roundedRect: layer.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let roundedMaskLayer = CAShapeLayer()
//        roundedMaskLayer.frame = layer.bounds
//        roundedMaskLayer.path = roundedMaskPath.cgPath
//        self.layer.mask = roundedMaskLayer
//
//        self.layer.masksToBounds = true
//        self.clipsToBounds = true
//
//        if isShadow == true {
//            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//            self.layer.shadowOffset = CGSize(width: 0, height: 0)
//            self.layer.shadowOpacity = 1.0
//            self.layer.shadowRadius = 3.0
//        }
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = self.center
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        let bezirePath = UIBezierPath(roundedRect: self.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: radius, height: radius))
        shapeLayer.bounds = frame
        shapeLayer.path = bezirePath.cgPath

        self.layer.mask = shapeLayer
        
    }
    
    
    //MARK:- Black button
    func setButtonCircle(color: UIColor, textColor: UIColor) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = self.layer.frame.height / 2
        self.layer.borderWidth = 0
        self.layer.backgroundColor = color.cgColor
        self.layer.borderColor = color.cgColor
        self.setTitleColor(textColor, for: .normal)
        self.layer.opacity = 1
    }
    
    //MARK:- Line under title
    func setLineUnderTitle(title: String) {
        
        let underLine: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 15),
        .foregroundColor: Theme.currentTheme.themeBlackColor,
        .underlineStyle: NSUnderlineStyle.single.rawValue]
        
        let attributeString = NSMutableAttributedString(string: customeTextLocalization(key: title), attributes: underLine)
        self.setAttributedTitle(attributeString, for: .normal)
    }
    
    
    
}// end
