//
//  ImageViewExtenstion.swift
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

extension UIImageView {
    
    func setCircleImage() {
        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
    func setImageRoundedCornersWithBorder(radius: CGFloat, borderWitdth: CGFloat?, borderColor: UIColor?, isShadow: Bool) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWitdth ?? 0
        self.layer.borderColor = borderColor?.cgColor
        
        if isShadow == true {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 3.0
        }
    }
    
    func setGradientEffect(color: UIColor, startPoint: CGPoint, endPoint:CGPoint) {
                
        let maskedView = UIView(frame: CGRect(x: 0 , y: 0, width: self.bounds.width * 1.5, height: self.bounds.height))
        maskedView.backgroundColor = .darkGray
                
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = CGRect(x: 0 , y: 0, width: self.bounds.width * 1.5, height: self.bounds.height)
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, color.cgColor, color.cgColor]
        gradientMaskLayer.locations = [0, 0, 0.5, 1.0]
        maskedView.layer.mask = gradientMaskLayer
        maskedView.layer.opacity = 0.5
        self.addSubview(maskedView)
        
    }
    
}// end
