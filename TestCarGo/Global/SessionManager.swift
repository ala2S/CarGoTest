//
//  SessionManager.swift
//
//  Created by Mahmoud Elmoghazy on 3/6/19.
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

class SessionManager {
    
    static let userDefault = UserDefaults.standard
    
    //MARK:- General Settings
    // en = 1 for .net, for Php is en
    // ar = 2 for .net, for Php is ar
    static var appLanguage = ""
    static var isIpad = "false"
    static var appOpendCount = "0"
    static var applicationCountry = ""
    
    // true / false
    static var onBoardViewed = "false"
    // end general setting
    
    //MARK:- User
    // true / false
    static var isLoggedIn = "false"
    
    // true / false
    static var isGuest = ""
    
    // true / false
    static var keepMeLogin = ""
    
    // true / false
    static var userIsActive = ""
    static var userTokenKey = ""
    static var userId = ""
    static var userName = ""
    static var userPassword = ""
    static var userEmail = ""
    static var userFirstName = ""
    static var userLastName = ""
    static var userFullName = ""
    static var userPhone = ""
    // end user
    
    //MARK:- Selected flythu flight
    // quote_id
    
    static var selectedFlightQuoteId = ""
    //end selected flythu flight
    
    //MARK:- Theme Settings
    /*
     * this section will content all the variables for theme color
     * theme setting will start application with the default values as per design
     * theme setting will change based on the setting in the CMS and will effect on the app when recieved the new colors
     */
    
    static var themeName = "DefaultTheme"
    static var themeDarkBlueColor = "2C4B76"
    static var themeGrayColor = "707070"
    static var themeGreenColor = "0fcf08"
    static var themeOrangeColor = "f69c30"    
    static var themeBlackColor = "000000"
    static var themeWhiteColor = "fffffff"
    static var themeLightWhiteColor = "EDF7F9"
    static var themeLightGrayColor = "5C5C5C"
    static var themeLightOrangeColor = "F4C993"
    static var themeLightBlueColor = "1f3c63"
    static var themeBlueColor = "2BA1D9"
    
    
    //End theme setting
    
    
    static func load() {
        
        //MARK:- General Settings
        if let appLanguage = userDefault.string(forKey: "appLanguage") {
            SessionManager.appLanguage = appLanguage
        }
        
        if let isIpad = userDefault.string(forKey: "isIpad") {
            SessionManager.isIpad = isIpad
        }
        
        if let appOpendCount = userDefault.string(forKey: "appOpendCount") {
            SessionManager.appOpendCount = appOpendCount
        }
        
        if let applicationCountry = userDefault.string(forKey: "applicationCountry") {
            SessionManager.applicationCountry = applicationCountry
        }
        
        if let onBoardViewed = userDefault.string(forKey: "onBoardViewed") {
            SessionManager.onBoardViewed = onBoardViewed
        }
        // end general setting
        
        //MARK:- Selected flythu flight
        // quote_id
        
        if let selectedFlightQuoteId = userDefault.string(forKey: "selectedFlightQuoteId") {
            SessionManager.selectedFlightQuoteId = selectedFlightQuoteId
        }
        //end selected flythu flight
        
        
        //MARK:- User
        if let isLoggedIn = userDefault.string(forKey: "isLoggedIn") {
            SessionManager.isLoggedIn = isLoggedIn
        }
        
        if let isGuest = userDefault.string(forKey: "isGuest") {
            SessionManager.isGuest = isGuest
        }
        
        if let keepMeLogin = userDefault.string(forKey: "keepMeLogin") {
            SessionManager.keepMeLogin = keepMeLogin
        }
        
        if let userIsActive = userDefault.string(forKey: "userIsActive") {
            SessionManager.userIsActive = userIsActive
        }
        
        if let userTokenKey = userDefault.string(forKey: "userTokenKey") {
            SessionManager.userTokenKey = userTokenKey
        }
        
        if let userId = userDefault.string(forKey: "userId") {
            SessionManager.userId = userId
        }
        
        if let userName = userDefault.string(forKey: "userName") {
            SessionManager.userName = userName
        }
        
        if let userPassword = userDefault.string(forKey: "userPassword") {
            SessionManager.userPassword = userPassword
        }
        
        if let userEmail = userDefault.string(forKey: "userEmail") {
            SessionManager.userEmail = userEmail
        }
        
        if let userFirstName = userDefault.string(forKey: "userFirstName") {
            SessionManager.userFirstName = userFirstName
        }
        
        if let userLastName = userDefault.string(forKey: "userLastName") {
            SessionManager.userLastName = userLastName
        }
        
        if let userFullName = userDefault.string(forKey: "userFullName") {
            SessionManager.userFullName = userFullName
        }
        
        if let userFullName = userDefault.string(forKey: "userFullName") {
            SessionManager.userFullName = userFullName
        }
        
        if let userPhone = userDefault.string(forKey: "userPhone") {
            SessionManager.userPhone = userPhone
        }
        // end user
        
        //MARK:- Theme Settings
        if let themeName = userDefault.string(forKey: "themeName") {
            SessionManager.themeName = themeName
        }
        // end theme settings
        
    }
    
    static func save() {
        
        //MARK:- General Settings
        userDefault.setValue(appLanguage, forKey: "appLanguage")
        userDefault.setValue(isIpad, forKey: "isIpad")
        userDefault.setValue(appOpendCount, forKey: "appOpendCount")
        userDefault.setValue(applicationCountry, forKey: "applicationCountry")
        userDefault.setValue(onBoardViewed, forKey: "onBoardViewed")
        // end general setting
        
        //MARK:- Selected flythu flight
        // quote_id
        
        userDefault.setValue(selectedFlightQuoteId, forKey: "selectedFlightQuoteId")
        //end selected flythu flight
        
        //MARK:- User
        userDefault.setValue(isLoggedIn, forKey: "isLoggedIn")
        userDefault.setValue(isGuest, forKey: "isGuest")
        userDefault.setValue(keepMeLogin, forKey: "keepMeLogin")
        userDefault.setValue(userIsActive, forKey: "userIsActive")
        userDefault.setValue(userTokenKey, forKey: "userTokenKey")
        userDefault.setValue(userId, forKey: "userId")
        userDefault.setValue(userName, forKey: "userName")
        userDefault.setValue(userPassword, forKey: "userPassword")
        userDefault.setValue(userEmail, forKey: "userEmail")
        userDefault.setValue(userFirstName, forKey: "userFirstName")
        userDefault.setValue(userLastName, forKey: "userLastName")
        userDefault.setValue(userFullName, forKey: "userFullName")
        userDefault.setValue(userPhone, forKey: "userPhone")
        // end user
        
        //MARK:- Theme Settings
        userDefault.setValue(themeName, forKey: "themeName")
        //end theme setting
        
        userDefault.synchronize()
        
    }
    
    static func reset() {
        
        userDefault.removeObject(forKey: "onBoardViewed")
        userDefault.removeObject(forKey: "isGuest")
        userDefault.removeObject(forKey: "keepMeLogin")
        userDefault.removeObject(forKey: "userIsActive")
        userDefault.removeObject(forKey: "isLoggedIn")
        userDefault.removeObject(forKey: "userTokenKey")
        userDefault.removeObject(forKey: "userName")
        userDefault.removeObject(forKey: "userPassword")
        userDefault.removeObject(forKey: "userEmail")
        userDefault.removeObject(forKey: "userId")
        userDefault.removeObject(forKey: "userFirstName")
        userDefault.removeObject(forKey: "userLastName")
        userDefault.removeObject(forKey: "userFullName")
        userDefault.removeObject(forKey: "userPhone")
        userDefault.removeObject(forKey: "applicationCountry")
        
        //MARK:- Selected flythu flight
        // quote_id
        
        userDefault.removeObject(forKey: "selectedFlightQuoteId")
        //end selected flythu flight
        
        userDefault.synchronize()
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
        
    }
    
    
}// end
