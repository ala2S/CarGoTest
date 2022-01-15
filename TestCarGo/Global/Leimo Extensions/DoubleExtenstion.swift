//
//  DoubleExtenstion.swift
//  Flythru
//
//  Created by Mahmoud Elmoghazy on 22/02/2021.
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

extension Double {
    
    func fromTimeStampToDateString() -> (String, String) {
        
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current //TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd" //Specify your format that you want
        
        let finalData = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeZone = .current //TimeZone(abbreviation: "GMT") //Set timezone that you want
        timeFormatter.locale = .current
        timeFormatter.dateFormat = "HH:mm a" //Specify your format that you want
        
        let finalTime = timeFormatter.string(from: date)
        
        return (finalData, finalTime)
        
    }
    
    func fromTimeStampToDateStringFormatted() -> (String, String) {
        
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone =  .current //TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "dd MMM yyyy" //Specify your format that you want
        
        let finalData = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeZone =  .current //TimeZone(abbreviation: "GMT") //Set timezone that you want
        timeFormatter.locale = .current
        timeFormatter.dateFormat = "HH:mm a" //Specify your format that you want
        
        let finalTime = timeFormatter.string(from: date)
        
        return (finalData, finalTime)
        
    }
}
