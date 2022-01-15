//
//  StringExtension.swift
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

enum passwordComplexity: String {
    
    /// Minimum 8 characters at least 1 Alphabet and 1 Number:
    case regex1 = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    
    /// Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:
    case regex2 = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    
    /// Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:
    case regex3 = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    
    /// Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
    case regex4 = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    
    /// Minimum 8 to Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
    case regex5 = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,10}"
    
}

enum dateTimeFormats: String {
    
    // format "EEEE, MMM d, yyyy" example Tuesday, Aug 3, 2021
    case EEEE_MMM_d_yyyy = "EEEE, MMM d, yyyy"
    
    // format "MM/dd/yyyy" example 08/03/2021
    case MM_dd_yyyy = "MM/dd/yyyy"
    
    // format example 08-03-2021 09:52
    case MM_dd_yyyy_HH_mm = "MM-dd-yyyy HH:mm"
    
    // format "MM-dd-yyyy HH:mm" example Aug 3, 9:52 AM
    case MMM_d_h_mm_a = "MMM d, h:mm a"
    
    // format "MMMM yyyy" example August 2021
    case MMMM_yyyy = "MMMM yyyy"
    
    // format "MMM d, yyyy" example Aug 3, 2021
    case MMM_d_yyyy = "MMM d, yyyy"
    
    // format "E, d MMM yyyy HH:mm:ss Z" example Tue, 3 Aug 2021 09:52:02 +0000
    case E_d_MMM_yyyy_HH_mm_ss_Z = "E, d MMM yyyy HH:mm:ss Z"
    
    // format "yyyy-MM-dd'T'HH:mm:ssZ" example 2021-08-03T09:52:02+0000
    case yyyy_MM_dd_T_HH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    // format "dd.MM.yy" example 03.08.21
    case dd_MM_yy = "dd.MM.yy"
    
    // format "HH:mm:ss.SSS" example 09:52:02.753
    case HH_mm_ss_SSS = "HH:mm:ss.SSS"
    
    // format "yyyy-MM-dd" example 2021-12-01
    case yyyy_MM_dd = "yyyy-MM-dd"
    
    // format "yyyy-MM-dd HH:mm" example 2021-10-01 13:45
    case yyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm"
    
    // format "dd MMM yyyy" example "02 Oct 2021"
    case dd_MMM_yyyy = "dd MMM yyyy"
    
    // format "HH:mm" example 13:45
    case HH_mm = "HH:mm"
    
}

extension String {
    
    // Regex password
    func isValidPassword() -> Bool {
        
        let regularExpression = passwordComplexity.regex4.rawValue
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidWebUrl() -> Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: self)
    }
    
    func isPhoneNumber() -> Bool {
        let PHONE_REGEX = "^[0-9+]{0,1}+[0-9]{8,16}$"
        // "^(00|\\+)[1-9]{1}([0-9][\\s]*){6,16}$" //"^((\\+)|(00))[0-9]{4,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: self)
        return result
    }
    
    
    func toDate() -> Date {
        
        let fullString = self//components(separatedBy: "T")
        let dateString = fullString //[0]
        
        //"2020-04-01T05:30:00"
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.timeZone = TimeZone(identifier: "UTC")
        // inFormatter.timeZone = .current
        inFormatter.dateFormat = "yyyy-MM-dd"
        
        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.timeZone = TimeZone(identifier: "UTC")
        // outFormatter.timeZone = .current
        outFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = inFormatter.date(from: dateString) ?? Date()
        return date
    }
    
    func toDateTime() -> Date {
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.timeZone = TimeZone(identifier: "UTC")
        inFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let date = inFormatter.date(from: self) ?? Date()
        return date
    }
    
    func toStringDate() -> String {
        
        let fullString = self //.components(separatedBy: "T")
        let dateString = fullString // [0]
        
        //1981-11-20T00:00:00
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.timeZone = TimeZone(identifier: "UTC")
        inFormatter.timeZone = .current
        inFormatter.dateFormat = "yyyy-MM-dd"
        
        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.timeZone = TimeZone(identifier: "UTC")
        outFormatter.timeZone = .current
        outFormatter.dateFormat = "dd MMM yyyy"
        
        guard let date = inFormatter.date(from: dateString) else { return "" }
        let finalData = outFormatter.string(from: date)
        return finalData
    }
    
    func toStringTime() -> String {
        
        let fullString = self //.components(separatedBy: "T")
        let timeString = fullString //[1]
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.timeZone = TimeZone(identifier: "UTC")
        inFormatter.timeZone = .current
        inFormatter.dateFormat = "HH:mm"
        
        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        outFormatter.timeZone = TimeZone(identifier: "UTC")
        outFormatter.timeZone = .current
        outFormatter.dateFormat = "h:mm a"
        
        guard let time = inFormatter.date(from: timeString) else { return "" }
        let finalTime = outFormatter.string(from: time)
        return finalTime
    }
    
    func toStringDateDMY() -> String {
        
        let fullString = self //.components(separatedBy: "T")
        let dateString = fullString //[1]
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        //        inFormatter.timeZone = TimeZone(identifier: "UTC")
        inFormatter.timeZone = .current
        inFormatter.dateFormat = "yyyy-MM-dd"
        
        let outFormatter = DateFormatter()
        outFormatter.locale = Locale(identifier: "en_US_POSIX")
        //        outFormatter.timeZone = TimeZone(identifier: "UTC")
        outFormatter.timeZone = .current
        outFormatter.dateFormat = "dd-MM-yyyy"
        
        guard let date = inFormatter.date(from: dateString) else { return "" }
        let finalDate = outFormatter.string(from: date)
        return finalDate
    }
    
    func to24Time() -> Date {
        
        let inFormatter = DateFormatter()
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        inFormatter.timeZone = TimeZone(identifier: "UTC")
        inFormatter.dateFormat = "HH:mm"
        
        let time = inFormatter.date(from: self) ?? Date()
        return time
    }
    
    var htmlToAttributedString: NSAttributedString? {
        
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func add(urlString: String) -> String {
        return (self + urlString)
    }
    
    var characterArray: [Character] {
        var characterArray = [Character]()
        for character in self {
            characterArray.append(character)
        }
        return characterArray
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    
    
}//end


