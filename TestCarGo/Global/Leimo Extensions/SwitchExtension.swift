//
//  SwitchExtension.swift
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


extension UISwitch {
    
    func setSize(width: CGFloat, height: CGFloat) {
        
        let standardHeight: CGFloat = 31 // 31
        let standardWidth: CGFloat = 51 // 51
        
        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth
        
        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
    
    func switchSameBackgroundColor(onColor: UIColor, offColor: UIColor, borderColor: UIColor?) {
        
        /*For on state*/
        self.onTintColor = onColor
        
        /*For off state*/
        
        self.tintColor = offColor
        self.backgroundColor = offColor
        
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor
        
    }
    
    func switchWithNarrowViewSlider() {
        
        let origilierUiview = self.subviews[0].subviews[1].subviews[1]
        let newSlider = UIView(frame: CGRect(x: 0, y: 11, width: 50, height: 20))
        
        origilierUiview.backgroundColor = Theme.currentTheme.themeLightWhiteColor
        newSlider.backgroundColor = Theme.currentTheme.themeGrayColor
        newSlider.setUiviewSelectedRoundCorner(corners: [.allCorners], radius: 5, width: 50, height: 10)
        
        origilierUiview.addSubview(newSlider)
        
    }
    
    
    
}

