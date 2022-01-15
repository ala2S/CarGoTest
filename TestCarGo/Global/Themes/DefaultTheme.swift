//
//  DefaultTheme.swift
//  Theme
//
//  Created by Mahmoud Elmoghazy on 7/28/19.
//  Copyright © 2019 Leimo. All rights reserved.
//

import Foundation
import UIKit

class DefaultTheme :ThemeProtocol {
    
    
    init() {
        SessionManager.load()
    }
    
    //MARK:- Theme font name
    var themeEnglishFontName: String  = "Raleway-Regular"
    var themeBoldEnglishFontName: String  = "Raleway-SemiBold"
    var themeArabicFontName: String = "Arial"
    
    //MARK:- Theme colors
    var themeDarkBlueColor: UIColor = UIColor(hex: SessionManager.themeDarkBlueColor)
    var themeGrayColor: UIColor = UIColor(hex: SessionManager.themeGrayColor)
    var themeGreenColor: UIColor = UIColor(hex: SessionManager.themeGreenColor)
    var themeOrangeColor: UIColor = UIColor(hex: SessionManager.themeOrangeColor)
    var themeLightWhiteColor: UIColor = UIColor(hex: SessionManager.themeLightWhiteColor)
    var themeBlackColor: UIColor = UIColor(hex: SessionManager.themeBlackColor)
    var themeWhiteColor: UIColor = UIColor(hex: SessionManager.themeWhiteColor)
    var themeLightGrayColor: UIColor = UIColor(hex: SessionManager.themeLightGrayColor)
    var themeLightOrangeColor: UIColor = UIColor(hex: SessionManager.themeLightOrangeColor)
    var themLightBlueColor: UIColor = UIColor(hex: SessionManager.themeLightBlueColor)
    var themeBlueColor: UIColor = UIColor(hex: SessionManager.themeBlueColor)
    
    
}
