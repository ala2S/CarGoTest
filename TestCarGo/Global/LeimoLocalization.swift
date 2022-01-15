//
//  Leimo Localization.swift
//  Created by Mahmoud Elmoghazy on 10/21/17.
//  mahmoud.abdallah@outlook.com
//  Copyright © 2019 Mahmoud Elmoghazy. All rights reserved.
// this line not allow firbase notification to work  and get the token key so in you will use firebase notification please add this line in fire base message function

import Foundation
import UIKit

var currentValue = ""
var tName: String?
var currentLanguage = "en"
var b = Bundle()

class changeLanguage {
    
    var language = ""
    
    // Methods
    func selectedLanguage(languageDirection: String, appLanguage: String){
        
        switch languageDirection{
        case "LTR":
            languages.setNewLanguage(language: appLanguage)
            language = appLanguage
            currentLanguage = appLanguage
            
        case "RTL" :
            languages.setNewLanguage(language: appLanguage)
            language = appLanguage
            currentLanguage = appLanguage
            
        default:
            break
        }
    }
    
    class var changeLang: changeLanguage{
        struct Static{
            static let instance = changeLanguage()
        }
        return Static.instance
    }
}

class LeimoDoLocalize{
    class func LeimoDoExchange() {
        
        ExchangeAppleMethod(
            className: Bundle.self,
            oreginalSelector: #selector(Bundle.localizedString(forKey:value:table:)),
            overrideSelector: #selector(Bundle.customLocalizedStringForKey(_:value:table:))
        )
    }
}

class languages{
    class func getCurrentlanguage()->String{
        let userDefaultLanguge = UserDefaults.standard
        let language = userDefaultLanguge.object(forKey: "AppleLanguages") as! NSArray
        let currentLang = language.firstObject as! String
        return currentLang
    }
    
    // set new language
    class func setNewLanguage(language:String){
        
        let userDefaultLanguge = UserDefaults.standard
        userDefaultLanguge.set([language, getCurrentlanguage()], forKey: "AppleLanguages")
        userDefaultLanguge.synchronize()
        
        if language == "ar"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
}

func ExchangeAppleMethod(className:AnyClass, oreginalSelector: Selector, overrideSelector: Selector){
    
    let originalMethod: Method = class_getInstanceMethod(className, oreginalSelector)!
    let overrideMethod: Method = class_getInstanceMethod(className, overrideSelector)!
    
    if class_addMethod(className, oreginalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)){
        class_replaceMethod(className, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    }else{
        method_exchangeImplementations(originalMethod, overrideMethod)
    }
}

func customeTextLocalization(key: String) -> String{
    
    if let path2 = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"){
        b = Bundle(path: path2)!
        let localoizatoinString: String = NSLocalizedString(key, tableName: "Main", bundle: b, value: key, comment: "")
        return localoizatoinString
    }
    return key
}

extension Bundle{
    
    @objc func customLocalizedStringForKey(_ key: String, value:String?, table tableName:String)->String{
        
        var bundle = Bundle()
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"){
            bundle = Bundle(path:path)!
            b = bundle
            
        }else {
            let path = Bundle.main.path(forResource: "Base", ofType: "lproj")
            bundle = Bundle(path: path!)!
        }
        
        currentValue = value ?? ""
        
        tName = tableName
        return (bundle.customLocalizedStringForKey(value ?? "", value: value, table: tName!))
    }
}

@available(iOS 13.0, *)
extension UIViewController{
    func changeLanguageAndFlipView (direction: String, language: String, viewId: String){
        
        changeLanguage.changeLang.selectedLanguage(languageDirection: direction, appLanguage: language)
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (_) in
            
            let scene = UIApplication.shared.connectedScenes.first
            if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
                let rootViewcontroller: UIWindow = sceneDelegate.window!
                rootViewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: viewId)
                
            }else{
                
                let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)! // for delgate
                rootviewcontroller.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: viewId)
                _ = (UIApplication.shared.delegate?.window!)!
            }
        }
    }
}

extension UITextView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if SessionManager.appLanguage == "2" {
            if textAlignment == .natural {
                self.textAlignment = .right
            }
        }else if SessionManager.appLanguage == "1"{
            if textAlignment == .natural {
                self.textAlignment = .left
            }
            self.font = UIFont(name: Theme.currentTheme.themeEnglishFontName, size: (self.font?.pointSize)!)
        }
    }
}
