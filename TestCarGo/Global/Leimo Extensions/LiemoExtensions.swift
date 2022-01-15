////
////  LiemoExtensions.swift
////  Created by Mahmoud Elmoghazy on 3/6/19.
////  mahmoud.abdallah@outlook.com
////  Copyright © 2019 Mahmoud Elmoghazy. All rights reserved.
////
//
//import Foundation
//import UIKit
//
////MARK:- UIColor
//extension UIColor {
//    convenience init(hex: String) {
//        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 0
//        
//        var rgbValue: UInt64 = 0
//        
//        scanner.scanHexInt64(&rgbValue)
//        
//        let r = (rgbValue & 0xff0000) >> 16
//        let g = (rgbValue & 0xff00) >> 8
//        let b = rgbValue & 0xff
//        
//        self.init(
//            red: CGFloat(r) / 0xff,
//            green: CGFloat(g) / 0xff,
//            blue: CGFloat(b) / 0xff, alpha: 1
//        )
//    }
//}
//
////MARK:- Golobal Alert
//extension UIViewController {
//    
//    func globalAlert(title: String, message: String){
//        
//        let alert = UIAlertController(title: customeTextLocalization(key: title), message: customeTextLocalization(key: message), preferredStyle: .alert)
//        let okAction = UIAlertAction(title: customeTextLocalization(key: "Yes"), style: .default, handler: nil)
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
//    }
//    
//    func globaleAlretSheet(title: String? = nil, message:String? = nil) {
//        
//        let alartStyle: UIAlertController.Style?
//        
//        if SessionManager.isIpad == "true" {
//            alartStyle = .alert
//        }else{
//            alartStyle = .actionSheet
//        }
//        
//        let alertSheet = UIAlertController(title: customeTextLocalization(key: title ?? ""), message: customeTextLocalization(key: message ?? ""), preferredStyle: alartStyle ?? .alert)
//        let okAction = UIAlertAction(title: customeTextLocalization(key: "Ok"), style: .default, handler: nil)
//        
//        alertSheet.addAction(okAction)
//        
//        self.present(alertSheet, animated: true, completion: nil)
//    }
//    
//    // please call this method in view did appear
//    func setStatusBarColor() {
//        
//        if #available(iOS 13.0, *) {
//            
//            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
//            statusBar.backgroundColor =  Theme.currentTheme.themeNavigationBarColor  //UIColor(red: 245/255, green: 195/255, blue: 12/255, alpha: 1.0) /* #f8ba0c */ //
//            UIApplication.shared.keyWindow?.addSubview(statusBar)
//            
//        } else {
//            
//            UIApplication.shared.statusBarView?.backgroundColor = Theme.currentTheme.themeNavigationBarColor
//        }
//    }
//}
//
////MARK:- UI Application
//extension UIApplication {
//    var statusBarView: UIView? {
//        if responds(to: Selector(("statusBar"))) {
//            return value(forKey: "statusBar") as? UIView
//        }
//        return nil
//    }
//}
//
////MARK:- String
//extension String {
//    // Regex password
//    func isValidPassword() -> Bool {
//        
//        /*
//         Minimum 8 characters at least 1 Alphabet and 1 Number:
//         "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
//         
//         Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:
//         "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
//         
//         Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:
//         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
//         
//         Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
//         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
//         
//         Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:
//         "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,10}"
//         */
//        
//        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}" //"^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$" // 6 characters only
//        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
//        
//        return passwordValidation.evaluate(with: self)
//    }
//    
//    func isValidEmail() -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: self)
//    }
//    
//    func isValidWebUrl() -> Bool {
//        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
//        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
//        return predicate.evaluate(with: self)
//    }
//    
//    func isPhoneNumber() -> Bool {
//        let PHONE_REGEX =  "^(00|\\+)[1-9]{1}([0-9][\\s]*){6,16}$" //"^((\\+)|(00))[0-9]{4,14}$"
//        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//        let result = phoneTest.evaluate(with: self)
//        return result
//    }
//    
//    func toDate() -> Date {
//        
//        let fullString = self.components(separatedBy: "T")
//        let dateString = fullString[0]
//        
//        //"2020-04-01T05:30:00"
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        // inFormatter.timeZone = .current
//        inFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let outFormatter = DateFormatter()
//        outFormatter.locale = Locale(identifier: "en_US_POSIX")
//        outFormatter.timeZone = TimeZone(identifier: "UTC")
//        // outFormatter.timeZone = .current
//        outFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let date = inFormatter.date(from: dateString) ?? Date()
//        return date
//    }
//    
//    func toDate2() -> Date {
//        
//        //"2020-04-01T05:30:00"
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        inFormatter.dateFormat = "dd.MM.yyyy"
//        
//        let date = inFormatter.date(from: self) ?? Date()
//        return date
//    }
//    
//    func toDate3() -> Date {
//        
//        //"2020-04-01T05:30:00"
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        inFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let date = inFormatter.date(from: self) ?? Date()
//        return date
//    }
//    
//    func toDateTime() -> Date {
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        inFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//        
//        let date = inFormatter.date(from: self) ?? Date()
//        return date
//    }
//    
//    func toStringDate() -> String {
//        
//        let fullString = self.components(separatedBy: "T")
//        let dateString = fullString[0]
//        
//        //"2020-04-01T05:30:00"
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        // inFormatter.timeZone = .current
//        inFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let outFormatter = DateFormatter()
//        outFormatter.locale = Locale(identifier: "en_US_POSIX")
//        outFormatter.timeZone = TimeZone(identifier: "UTC")
//        // outFormatter.timeZone = .current
//        outFormatter.dateFormat = "yyyy-MM-dd"
//        
//        let date = inFormatter.date(from: dateString)  ?? Date()
//        let finalData = outFormatter.string(from: date)
//        return finalData
//    }
//    
//    func toStringDate2() -> String {
//        
//        let fullString = self.components(separatedBy: "T")
//        let dateString = fullString[0]
//        
//        //"2020-04-01T05:30:00"
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        // inFormatter.timeZone = .current
//        inFormatter.dateFormat = "dd.MM.yyyy"
//        
//        let outFormatter = DateFormatter()
//        outFormatter.locale = Locale(identifier: "en_US_POSIX")
//        outFormatter.timeZone = TimeZone(identifier: "UTC")
//        // outFormatter.timeZone = .current
//        outFormatter.dateFormat = "dd.MM.yyyy"
//        
//        let date = inFormatter.date(from: dateString)  ?? Date()
//        let finalData = outFormatter.string(from: date)
//        return finalData
//    }
//    
//    func to24Time() -> Date {
//        
//        let inFormatter = DateFormatter()
//        inFormatter.locale = Locale(identifier: "en_US_POSIX")
//        inFormatter.timeZone = TimeZone(identifier: "UTC")
//        inFormatter.dateFormat = "HH:mm"
//        
//        let time = inFormatter.date(from: self) ?? Date()
//        return time
//    }
//    
//    var htmlToAttributedString: NSAttributedString? {
//        
//        guard let data = data(using: .utf8) else { return NSAttributedString() }
//        do {
//            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
//        } catch {
//            return NSAttributedString()
//        }
//    }
//    
//    var htmlToString: String {
//        return htmlToAttributedString?.string ?? ""
//    }
//    
//    func add(urlString: String) -> String {
//        return (self + urlString)
//    }
//}
//
////MARK:- UIView
//extension UIView{
//    
//    func setUiViewRoundedCorners(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor?, backGroundColor: UIColor?){
//        
//        self.layer.masksToBounds = true
//        self.clipsToBounds = true
//        
//        self.backgroundColor = backGroundColor
//        
//        self.layer.borderColor = borderColor?.cgColor
//        self.layer.borderWidth = borderWidth
//        self.layer.cornerRadius = radius
//    }
//    
//    func setUiViewFullRoundedCorner(borderWidth: CGFloat, borderColor: UIColor?, backGroundColor: UIColor?) {
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        
//        self.layer.borderWidth = borderWidth
//        self.layer.borderColor = borderColor?.cgColor
//        self.layer.cornerRadius = self.frame.height/2
//        
//        self.backgroundColor = backGroundColor
//    }
//    
//    func setUiViewRoundedCornersWithShadow(radius: CGFloat){
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        
//        self.layer.cornerRadius = radius
//        
//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOpacity = 0.9
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 4
//        layer.shouldRasterize = true
//        layer.rasterizationScale = true ? UIScreen.main.scale : 1
//    }
//    
//    func setUiViewSkew() {
//        self.transform =  CGAffineTransform(a: 1, b: 0, c: -0.3, d: 1.1, tx: 0, ty: 0)
//        self.layer.borderWidth = 1
//        //self.layer.borderColor = GlobalVariablesManager.sharedManager.binkColor.cgColor
//        self.layer.backgroundColor = UIColor.white.cgColor
//        self.layer.opacity = 0.4
//    }
//    
//    func setUiviewSelectedRoundCorner(corners: UIRectCorner, radius: CGFloat,width: CGFloat ,height: CGFloat) {
//        let rect = CGRect(x: 0, y: 0, width: width , height: height)
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//}
//
////MARK:- Buttons
//extension UIButton{
//    
//    func setButtonRoundedCornersPurbleColor(radius: CGFloat, borderWidth: CGFloat) {
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        self.layer.cornerRadius = radius
//        self.layer.borderWidth = borderWidth
//        self.layer.backgroundColor = Theme.currentTheme.themeNavigationBarColor.cgColor
//        self.layer.borderColor = Theme.currentTheme.themeNavigationBarColor.cgColor
//        self.setTitleColor(Theme.currentTheme.themeNavigationBarColor, for: .normal)
//        
//        //        if SessionManager.appLanguage == "en"{
//        //            //self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.englishFont
//        //        }else{
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.arabicFont
//        //        }
//        
//        self.layer.opacity = 1
//        
//        //        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        //        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        //        self.layer.shadowOpacity = 1.0
//        //        self.layer.shadowRadius = 3.0
//    }
//    
//    func setButtonRoundedCornersWithBorderOrange(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        self.layer.cornerRadius = radius
//        self.layer.borderWidth = borderWidth
//        self.layer.backgroundColor = UIColor.clear.cgColor
//        self.layer.borderColor = borderColor.cgColor
//        self.setTitleColor(Theme.currentTheme.themeNavigationBarColor, for: .normal)
//        
//        //        if SessionManager.appLanguage == "en"{
//        //            //self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.englishFont
//        //        }else{
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.arabicFont
//        //        }
//        
//        self.layer.opacity = 1
//        
//        //        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        //        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        //        self.layer.shadowOpacity = 1.0
//        //        self.layer.shadowRadius = 3.0
//    }
//    
//    
//    func setButtonRoundedCornersGrayColor(radius: CGFloat, borderWidth: CGFloat) {
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        self.layer.cornerRadius = radius
//        self.layer.borderWidth = borderWidth
//        self.layer.backgroundColor = Theme.currentTheme.themeNavigationBarColor.cgColor
//        self.layer.borderColor = Theme.currentTheme.themeNavigationBarColor.cgColor
//        self.setTitleColor(Theme.currentTheme.themeDarkTextColor, for: .normal)
//        
//        //        if SessionManager.appLanguage == "en"{
//        //            //self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.englishFont
//        //        }else{
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.arabicFont
//        //        }
//        
//        self.layer.opacity = 1
//        
//        //        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        //        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        //        self.layer.shadowOpacity = 1.0
//        //        self.layer.shadowRadius = 3.0
//    }
//    
//    func setButtonRoundedCornersOrangeColor(radius: CGFloat, borderWidth: CGFloat) {
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        self.layer.cornerRadius = radius
//        self.layer.borderWidth = borderWidth
//        self.layer.backgroundColor = Theme.currentTheme.themeNavigationBarColor.cgColor
//        self.layer.borderColor = Theme.currentTheme.themeGrayColor.cgColor
//        self.setTitleColor(Theme.currentTheme.themeNavigationBarColor, for: .normal)
//        
//        //        if SessionManager.appLanguage == "en"{
//        //            //self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.englishFont
//        //        }else{
//        //            self.titleLabel?.font = GlobalVariablesManager.sharedManager.arabicFont
//        //        }
//        
//        self.layer.opacity = 1
//        
//        //        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        //        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        //        self.layer.shadowOpacity = 1.0
//        //        self.layer.shadowRadius = 3.0
//    }
//    
//    func setButtonCustomRoundCorner(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//    
//    func setButtonWhiteFullRoundedCorner() {
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = false
//        self.backgroundColor = UIColor.white
//        self.setTitleColor(UIColor.black, for: .normal)
//        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//    }
//    
//    func setButtonCircleWithShadow() {
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.borderColor = UIColor(named: "veryLightPink")?.cgColor
//        self.layer.cornerRadius = 3
//        self.clipsToBounds = false
//        
//        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = 2.0
//    }
//    
//    func setButtonWithShadowOffset(width: Int, height: Int){
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        
//        self.layer.borderWidth = 0
//        self.layer.cornerRadius = 3
//        
//        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        self.layer.shadowOffset = CGSize(width: width, height: height)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = 2.0
//    }
//    
//    func setButtonCircleWithOutShadow() {
//        self.layer.borderWidth = 0
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = true
//    }
//    
//    func buttonAlignVertical(spacing: CGFloat = 6.0) {
//        
//        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
//        self.layer.cornerRadius = self.frame.height/2
//        self.backgroundColor = Theme.currentTheme.themeNavigationBarColor
//        
//        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowRadius = 4.0
//        
//        titleLabel?.numberOfLines = 2
//        titleLabel?.textAlignment = .center
//        
//        guard let imageSize = imageView?.image?.size,
//            let text = titleLabel?.text,
//            let font = titleLabel?.font
//            else { return }
//        
//        if SessionManager.appLanguage == "2" {
//            
//            titleEdgeInsets = UIEdgeInsets(
//                top: 0.0,
//                left: 0.0,
//                bottom: -(imageSize.height + spacing),
//                right: -imageSize.width
//            )
//            
//            let titleSize = text.size(withAttributes: [.font: font])
//            
//            imageEdgeInsets = UIEdgeInsets(
//                top: -(titleSize.height + spacing),
//                left: 0.0,
//                bottom: 5,
//                right: imageSize.width + (imageSize.width / 1.3)
//            )
//            
//            let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
//            contentEdgeInsets = UIEdgeInsets(
//                top: edgeOffset,
//                left: 0.0,
//                bottom: edgeOffset,
//                right: 0.0
//            )
//            
//        }else{
//            
//            titleEdgeInsets = UIEdgeInsets(
//                top: 0.0,
//                left: -imageSize.width,
//                bottom: -(imageSize.height + spacing),
//                right: 0.0
//            )
//            
//            let titleSize = text.size(withAttributes: [.font: font])
//            
//            imageEdgeInsets = UIEdgeInsets(
//                top: -(titleSize.height + spacing),
//                left: imageSize.width,
//                bottom: 5,
//                right: 0.0
//            )
//            
//            let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
//            contentEdgeInsets = UIEdgeInsets(
//                top: edgeOffset,
//                left: 0.0,
//                bottom: edgeOffset,
//                right: 0.0
//            )
//        }
//        
//        
//    }
//}
//
////MARK:- Circle image
//extension UIImageView{
//    func setCircleImage() {
//        self.layer.borderWidth = 1
//        self.layer.masksToBounds = false
//        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = true
//    }
//    
//    func setImageRoundedCorner() {
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = 10
//        self.layer.borderWidth = 3
//        self.layer.borderColor = Theme.currentTheme.themeNavigationBarColor.cgColor
//        
//    }
//    
//    func setImageStraight() {
//        self.transform =  CGAffineTransform(a: 1, b: 0, c: 0.3, d: 1, tx: 0, ty: 0)
//    }
//}
//
////MARK:- Text View
//extension UITextView{
//    func setTextViewBorder() {
//        self.layer.borderWidth = 1
//        self.layer.borderColor = Theme.currentTheme.themeGrayColor.cgColor
//        self.layer.backgroundColor = Theme.currentTheme.themeNavigationBarColor.cgColor//UIColor.white.cgColor
//        self.layer.cornerRadius = 10
//        self.layer.masksToBounds = true
//    }
//    
//    func setTextViewBorderWithGrayBackground() {
//        self.layer.borderWidth = 0
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.backgroundColor = UIColor(named: "carolinaBlue")?.cgColor
//        self.layer.cornerRadius = 5
//        self.layer.masksToBounds = true
//    }
//}
//
////MARK:- Text Field
//extension UITextField{
//    
//    func setTextFieldStraight() {
//        self.transform =  CGAffineTransform(a: 1, b: 0, c: 0.3, d: 1, tx: 0, ty: 0)
//    }
//    
//    func setTextFieldStraightWithLeftImage(imageName: String){
//        self.transform =  CGAffineTransform(a: 1, b: 0, c: 0.3, d: 1, tx: 0, ty: 0)
//        self.leftViewMode = UITextField.ViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
//        let image = UIImage(named: imageName)
//        imageView.image = image
//        imageView.contentMode = .left
//        self.leftView = imageView
//    }
//    
//    func setTextFieldWithRariusAndRightLeftViews(radius: CGFloat?, leftImage: String?, rightImage: String?) {
//        
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 5
//        self.backgroundColor = Theme.currentTheme.themeNavigationBarColor
//        self.layer.borderColor = Theme.currentTheme.themeGrayColor.cgColor
//        
//        let padding = 5
//        let size = 5
//        
//        //Left view
//        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: size))
//        if leftImage != nil {
//            let leftIconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
//            leftIconView.image = UIImage(named: leftImage ?? "")
//            leftIconView.contentMode = .scaleAspectFit
//            leftOuterView.addSubview(leftIconView)
//        }
//        leftView = leftOuterView
//        leftViewMode = .always
//        
//        //Right View
//        let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
//        if rightImage != nil {
//            let rightIconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
//            rightIconView.image = UIImage(named: rightImage ?? "")
//            rightIconView.contentMode = .scaleAspectFit
//            rightOuterView.addSubview(rightIconView)
//        }
//        rightView = rightOuterView
//        rightViewMode = .always
//    }
//    
//    func setTextFieldAsSearch(radius: CGFloat, leftImage: String?, rightImage: String?) {
//        
//        self.layer.masksToBounds = false
//        self.clipsToBounds = false
//        
//        self.layer.borderWidth = 0
//        self.layer.cornerRadius = 5
//        self.backgroundColor = Theme.currentTheme.themeNavigationBarColor
//        
//        //Left view
//        let leftOuterView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
//        if leftImage != nil {
//            let leftIconView  = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
//            leftIconView.image = UIImage(named: leftImage ?? "")
//            leftIconView.contentMode = .scaleAspectFit
//            leftOuterView.addSubview(leftIconView)
//        }
//        leftView = leftOuterView
//        leftViewMode = .always
//        
//        //Right View
//        let rightOuterView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
//        if rightImage != nil {
//            let rightIconView  = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
//            rightIconView.image = UIImage(named: rightImage ?? "")
//            rightIconView.contentMode = .scaleAspectFit
//            rightOuterView.addSubview(rightIconView)
//        }
//        rightView = rightOuterView
//        rightViewMode = .always
//    }
//    
//    // for pass image anc can change it from api
//    func setTextFieldFullRoundedCornersWithRightAndLeftImageGray(leftImageName: UIImageView, rightImageName: String) {
//        self.layer.masksToBounds = false
//        self.layer.cornerRadius = self.frame.height/2
//        self.clipsToBounds = false
//        self.backgroundColor = UIColor.lightGray
//        
//        self.rightViewMode = UITextField.ViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 40, height: 20))
//        let image = UIImage(named: rightImageName)
//        imageView.image = image
//        imageView.contentMode = .center
//        self.rightView = imageView
//        
//        self.leftViewMode = UITextField.ViewMode.always
//        let leftImageView = UIView(frame: CGRect(x: 10, y: 0, width: 40, height: 30))
//        leftImageView.addSubview(leftImageName)
//        self.leftView = leftImageView
//    }
//}
//
////MARK:- segmented
//extension UISegmentedControl {
//    
//    func removeBorders() {
//        
//        self.clipsToBounds = false
//        self.layer.masksToBounds = false
//        
//        //        if SessionManager.appLanguage == "en"{
//        //            self.setTitleTextAttributes([NSAttributedString.Key.font: GlobalVariablesManager.sharedManager.englishFont as Any],for: .normal)
//        //
//        //        }else{
//        //            self.setTitleTextAttributes([NSAttributedString.Key.font: GlobalVariablesManager.sharedManager.arabicFont as Any],for: .normal)
//        //        }
//        
//        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
//        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
//        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
//    }
//    
//    // create a 1x1 image with this color
//    private func imageWithColor(color: UIColor) -> UIImage {
//        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()
//        context!.setFillColor(color.cgColor)
//        context!.fill(rect)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image!
//    }
//}
//
////MARK:- Switch
//extension UISwitch {
//    func switchSameBackgroundColor() {
//        let onColor = Theme.currentTheme.themeNavigationBarColor
//        let offColor = Theme.currentTheme.themeNavigationBarColor
//        
//        let mSwitch = UISwitch(frame: CGRect.zero)
//        
//        /*For on state*/
//        self.onTintColor = onColor
//        
//        /*For off state*/
//        self.tintColor = offColor
//        self.layer.cornerRadius = mSwitch.frame.height / 2
//        self.backgroundColor = offColor
//    }
//}
//
////MARK:- Notifications
//extension Notification.Name {
//    static let filterResult = Notification.Name("")
//    static let advanceSearchFilter = Notification.Name("")
//    static let searchResult = Notification.Name("")
//    static let showroomRegisterAddressList = Notification.Name("")
//    
//}
//
////MARK:- Device Type
//extension UIDevice {
//    static let modelName: String = {
//        var systemInfo = utsname()
//        uname(&systemInfo)
//        let machineMirror = Mirror(reflecting: systemInfo.machine)
//        let identifier = machineMirror.children.reduce("") { identifier, element in
//            guard let value = element.value as? Int8, value != 0 else { return identifier }
//            return identifier + String(UnicodeScalar(UInt8(value)))
//        }
//        
//        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
//            #if os(iOS)
//            switch identifier {
//            case "iPod5,1": return "iPod Touch 5"
//            case "iPod7,1": return "iPod Touch 6"
//            case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
//            case "iPhone4,1": return "iPhone 4s"
//            case "iPhone5,1", "iPhone5,2": return "iPhone 5"
//            case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
//            case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
//            case "iPhone7,2": return "iPhone 6"
//            case "iPhone7,1": return "iPhone 6 Plus"
//            case "iPhone8,1": return "iPhone 6s"
//            case "iPhone8,2": return "iPhone 6s Plus"
//            case "iPhone9,1", "iPhone9,3": return "iPhone 7"
//            case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
//            case "iPhone8,4": return "iPhone SE"
//            case "iPhone10,1", "iPhone10,4": return "iPhone 8"
//            case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
//            case "iPhone10,3", "iPhone10,6": return "iPhone X"
//            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
//            case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad 3"
//            case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad 4"
//            case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
//            case "iPad5,3", "iPad5,4": return "iPad Air 2"
//            case "iPad6,11", "iPad6,12": return "iPad 5"
//            case "iPad7,5", "iPad7,6": return "iPad 6"
//            case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad Mini"
//            case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad Mini 2"
//            case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad Mini 3"
//            case "iPad5,1", "iPad5,2": return "iPad Mini 4"
//            case "iPad6,3", "iPad6,4": return "iPad Pro 9.7 Inch"
//            case "iPad6,7", "iPad6,8": return "iPad Pro 12.9 Inch"
//            case "iPad7,1", "iPad7,2": return "iPad Pro 12.9 Inch 2. Generation"
//            case "iPad7,3", "iPad7,4": return "iPad Pro 10.5 Inch"
//            case "AppleTV5,3": return "Apple TV"
//            case "AppleTV6,2": return "Apple TV 4K"
//            case "AudioAccessory1,1": return "HomePod"
//            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
//            default: return identifier
//            }
//            #elseif os(tvOS)
//            switch identifier {
//            case "AppleTV5,3": return "Apple TV 4"
//            case "AppleTV6,2": return "Apple TV 4K"
//            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
//            default: return identifier
//            }
//            #endif
//        }
//        
//        return mapToDevice(identifier: identifier)
//    }()
//}
