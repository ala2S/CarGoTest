//
//  GlobalVariablesManager.swift
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
import MapKit

class GlobalVariablesManager {
    
    //MARK:- Variables
    let tokenKey = ""
    let ApiKey = "123456"
    let FCMServerKey = "AAAAd1-CDBY:APA91bE8p3NCFUTd8w8D1mLT3XSY10yG6nuC-4tEE97WlkK3zJ6Arh0VBWwN3rftyX1yFehp2FAUN0tfSY7QO3KdYkpPod6QWqnI4YIShmTx-YGUhvz0tYIHHiBXD4fxss2xVHEx-IDE"
    let googleMapsKey = "AIzaSyDHZjBbbq3oLX6BCYbD-CsM9kq1SJBPYZo" 
    let googleSignInClientID = ""
    let twitterConsumerKey = ""
    let twitterConsumerSecretKEy = ""
    let platform = "iOS"
    
    var connection:Reachability?
    var deviceID = UIDevice.current.identifierForVendor?.uuidString
    var firebaseMessageTokenKey = ""
    var language = ""
    var uploadedFileName = ""
    var userName = ""
    
    var universalLink = false
    var universalLinkAdId = 0
    
    //MARK:- Methods
    class var sharedManager: GlobalVariablesManager {
        struct Static {
            static let instance = GlobalVariablesManager()
        }
        return Static.instance
    }
    
    // check inernet connection
    /// this method will be used to check if device has a coonection to internet
    func checkConnection() -> Bool {
        let reachability = Reachability()!
        if reachability.isReachable{
            print("Internet Connection Working")
            return true
        }else{
            print("No Intetnet Connection")
            return false
        }
    }
    
    
    
    
    /// this method will be used for load google maps application and take the destance location
    /// will open google maps with destance locaton and show routing
    /// if google maps not exist on device will open it as web on safari
    
    func loadMapApp(lat: String, long: String) {
        
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
            UIApplication.shared.openURL(URL(string:"comgooglemaps://?saddr=&daddr=\(lat),\(long)&directionsmode=driving")!)
            
        } else if (UIApplication.shared.canOpenURL(URL(string: "maps://")!)) {
            
            let latitude:CLLocationDegrees =  Double(lat)!
            let longitude:CLLocationDegrees =  Double(long)!
            
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = customeTextLocalization(key: "Dar Al Shifa Hospital")
            mapItem.openInMaps(launchOptions: options)
            
        }else {
            
            //"29.335498", long: "48.019217"
            if let urlDestination = URL.init(string: "https://www.google.com/maps/dir/?saddr=&daddr=\(lat),\(long)&directionsmode=driving") {
                UIApplication.shared.open(urlDestination)
            }
        }
    }
    
    func circleAnimation(circleOne: UIImageView?, circleTwo: UIImageView?) {
        UIView.animate(withDuration: 1, delay: 0.3, options: [], animations: {
            circleOne?.layer.opacity = 0.5
            circleTwo?.layer.opacity = 0.5
        }, completion: nil)
    }
    
    // check if ipad
    /// this method is used to get the device type is iPad or iPhone, and save the result in session manager
    func checkIsIpad() {
        
        //var screenWidth = UIScreen.main.bounds.width
        //var screenConst: CGFloat = 500.0
        
        if UIDevice.current.userInterfaceIdiom == .pad {

            SessionManager.isIpad = "true"
        }else {
            SessionManager.isIpad = "false"
        }

        SessionManager.save()
    }
    
    //load View with id
    /// this method will be global to load view and will view load based on the transaction type is presented or navigation
    /// transaction type is enum type
      
}// end

//Static Strings
struct StaticString {
    
    static let InternetConnectionAlert = "Internet connection is unavailable"
    static let ServerError = "Server is busy, please try again"
    static let SomeError = "Some error from server, and its notification is already displayed to user"
}

// Screen size
struct Screen {
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    static func isIphone6() -> Bool {
        return height == 667 ? true : false
    }
    static func isIphone5() -> Bool {
        return height == 568 ? true : false
    }
    static func isIphone6Plus() -> Bool {
        return height == 736 ? true : false
    }
    static func isIphone4() -> Bool {
        return height == 480 ? true : false
    }
}

@available(iOS 13.0, *)
var appDelegate = UIApplication.shared.delegate as! AppDelegate

//Show alert toast
func showToastWithMessage(message: String) {
    
}
