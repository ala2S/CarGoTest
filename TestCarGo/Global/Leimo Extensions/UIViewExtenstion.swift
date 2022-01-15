//
//  UIViewExtenstion.swift
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

extension UIView{
    
    func setUiViewRoundedCorners(radius: CGFloat,
                                 borderWidth: CGFloat,
                                 borderColor: UIColor?,
                                 backGroundColor: UIColor?) {
        
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        self.backgroundColor = backGroundColor
        
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
    }
    
    func setUiViewFullRoundedCorner(borderWidth: CGFloat,
                                    borderColor: UIColor?,
                                    backGroundColor: UIColor?) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        self.layer.cornerRadius = self.frame.height/2
        
        self.backgroundColor = backGroundColor
    }
    
    func setUiViewRoundedCornersWithShadow(radius: CGFloat,
                                           borderWidth: CGFloat,
                                           borderColor: UIColor?,
                                           backGroundColor: UIColor?,
                                           isShadow: Bool) {
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        self.layer.cornerRadius = radius
        self.backgroundColor = backGroundColor
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        
        if isShadow == true {
            
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOpacity = 0.8
            layer.shadowOffset = .zero
            layer.shadowRadius = 4
            layer.shouldRasterize = true
            layer.rasterizationScale = true ? UIScreen.main.scale : 1
        }
    }
    
    func setUiViewSkew() {
        
        self.transform =  CGAffineTransform(a: 1, b: 0, c: -0.3, d: 1.1, tx: 0, ty: 0)
        self.layer.borderWidth = 1
        //self.layer.borderColor = GlobalVariablesManager.sharedManager.binkColor.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.opacity = 0.4
    }
    
    
    
    func setUiviewSelectedRoundCorner(corners: UIRectCorner,
                                      radius: CGFloat,
                                      width: CGFloat,
                                      height: CGFloat) {
        
        let rect = CGRect(x: 0, y: 0, width: width , height: height)
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius,
            height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = true ? UIScreen.main.scale : 1
        
    }
    
    
    
}// end
