//
//  LeimoValidator.swift
//  LeimoValidator
//
//  Created by Mahmoud Elmoghazy on 7/15/18.
//  mahmoud.abdallah@outlook.com
//  Copyright © 2019 Mahmoud Elmoghazy. All rights reserved.
//

/*
 Copyright (c) 2019, Mahmoud Elmoghazy
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

class LeimoValidator: UIViewController ,UITextFieldDelegate {
    
    var currnetField = UITextField()
    static var isValied = true
    
    func liemoValidator(textFields: [UITextField]){
        let textFieldsArray = Array(textFields)
        checkTextFields(textFields: textFieldsArray)
    }
    
    private func checkTextFields(textFields: [UITextField]) {
        
        for field in textFields {
            
            if (field.text?.isEmpty)! {
                field.layer.borderWidth = 1
                field.layer.borderColor = UIColor.red.cgColor
                field.layer.cornerRadius = 0
                field.layer.masksToBounds = false
                field.clipsToBounds = false
                field.borderStyle = .none
                field.becomeFirstResponder()
                field.layer.backgroundColor = UIColor.white.withAlphaComponent(0.8).cgColor
                shake(textField: field, horizantaly: 4, Verticaly: 0)
                LeimoValidator.isValied = false
                
            }else {
                LeimoValidator.isValied = true
            }
        }
    }
    
    private func shake(textField: UITextField, horizantaly:CGFloat = 0 , Verticaly:CGFloat = 0) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - horizantaly, y: textField.center.y - Verticaly ))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + horizantaly, y: textField.center.y + Verticaly ))
        textField.layer.add(animation, forKey: "position")
    }
    
    
    
}// End
