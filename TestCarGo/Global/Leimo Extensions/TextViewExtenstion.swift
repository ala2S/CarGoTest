//
//  TextViewExtenstion.swift
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

extension UITextView{
    func setTextViewBorderAndRadious(borderWidth: CGFloat,
                                     radius: CGFloat,
                                     borderColor: UIColor?,
                                     backgroundColor: UIColor?) {
        
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        self.layer.backgroundColor = backgroundColor?.cgColor
        self.layer.cornerRadius = radius
       
    }
    
    func setTextViewBorderWithGrayBackground() {
        
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.backgroundColor = UIColor(named: "carolinaBlue")?.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    
    
    
    func typeOn(string: String, typeInterval: TimeInterval) {
        
        let characterArray = string.characterArray
        var characterIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: typeInterval, repeats: true) { (timer) in
            
            while characterArray[characterIndex] == " " {
                self.text.append(" ")
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
                                self.text.append(characterArray[characterIndex])
            })
            
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
                self.delegate?.textViewDidEndEditing?(self)
            }
        }
    }
    
    
    
}// end
