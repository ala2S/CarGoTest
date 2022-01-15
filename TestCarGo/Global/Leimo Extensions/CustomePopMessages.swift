//
//  CustomePopMessages.swift
//  Flythru
//
//  Created by Mahmoud Elmoghazy on 23/02/2021.
//

import Foundation

//extension UIViewController{
//    
//    func swiftMessageError(bodyMessage: String) {
//        
//        let view = MessageView.viewFromNib(layout: .cardView)
//        
//        view.configureTheme(.info)
//        view.configureDropShadow()
//        // let iconText = [""].sm_random()!
//        view.button?.isHidden = false
//        view.titleLabel?.isHidden = false
//        view.iconImageView?.isHidden = false
//        // view.configureContent(title: "", body: bodyMessage , iconText: iconText)
//        
//        view.configureContent(title: "Error", body: bodyMessage, iconImage: #imageLiteral(resourceName: "tipIcon"), iconText: nil, buttonImage: nil, buttonTitle: "ok") { (_) in
//            //print("Hello world")
//        }
//        
//        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
//        SwiftMessages.show(view: view)
//        
//        // Hide when button tapped
//       // view.buttonTapHandler = { _ in SwiftMessages.hide() }
//        
//        // Hide when message view tapped
//        view.tapHandler = { _ in SwiftMessages.hide() }
//    }
//    
//    func swiftMessageWarning(bodyMessage: String){
//        let view = MessageView.viewFromNib(layout: .cardView)
//        view.configureTheme(.warning)
//        view.configureDropShadow()
//        let iconText = [""].sm_random()!
//        view.button?.isHidden = true
//        view.titleLabel?.isHidden = true
//        
//        view.configureContent(title: "", body: bodyMessage, iconText: iconText)
//        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
//        SwiftMessages.show(view: view)
//        
//        // Hide when button tapped
//        view.buttonTapHandler = { _ in SwiftMessages.hide() }
//        
//        // Hide when message view tapped
//        view.tapHandler = { _ in SwiftMessages.hide() }
//    }
//    
//    func swiftMessageSuccess(bodyMessage: String){
//        let view = MessageView.viewFromNib(layout: .cardView)
//        view.configureTheme(.success)
//        view.configureDropShadow()
//        let iconText = [""].sm_random()!
//        view.button?.isHidden = true
//        view.titleLabel?.isHidden = true
//        view.configureContent(title: "", body: bodyMessage, iconText: iconText)
//        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
//        SwiftMessages.show(view: view)
//        
//        // Hide when button tapped
//        view.buttonTapHandler = { _ in SwiftMessages.hide() }
//        
//        // Hide when message view tapped
//        view.tapHandler = { _ in SwiftMessages.hide() }
//    }
//    
//    
//}
//
//import Darwin
//
//public extension Array {
//    
//    /**
//     Returns a random element from the array. Can be used to create a playful
//     message that cycles randomly through a set of emoji icons, for example.
//     */
//    public func sm_random() -> Iterator.Element? {
//        guard count > 0 else { return nil }
//        return self[Int(arc4random_uniform(UInt32(count)))]
//    }
//}
