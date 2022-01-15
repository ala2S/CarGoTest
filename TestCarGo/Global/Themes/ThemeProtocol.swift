//
//  ThemeProtocol.swift
//  Theme
//
//  Created by Mahmoud Elmoghazy on 7/28/19.
//  Copyright © 2019 Leimo. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    
    //MARK:- Theme font name
    var themeEnglishFontName: String {get}
    var themeBoldEnglishFontName: String {get}
    var themeArabicFontName: String {get}
    
    //MARK:- Theme colors    
    var themeDarkBlueColor: UIColor {get}
    var themeGrayColor: UIColor {get}
    var themeGreenColor: UIColor {get}
    var themeOrangeColor: UIColor {get}
    var themeLightWhiteColor: UIColor{get}
    var themeBlackColor: UIColor {get}
    var themeWhiteColor: UIColor {get}
    var themeLightGrayColor: UIColor {get}
    var themeLightOrangeColor: UIColor {get}
    var themLightBlueColor: UIColor {get}
    var themeBlueColor: UIColor {get}
    
}
