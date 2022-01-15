//
//  Typography.swift
//  StarterProject
//
//  Created by Adel Aref on 14/09/2021.
//

import Foundation
import UIKit
// swiftlint:disable all
enum Font: String {
    case montserratBold = "Montserrat-Bold"
    case montserratSemiBold = "Montserrat-SemiBold"
    case montserratMedium = "Montserrat-Medium"
    case montserratRegular = "Montserrat-Regular"
    case montserratLight = "Montserrat-Light"
    case sFUIRegular = "SFUIText-Regular"
    case ralewayMedium = "Raleway-Regular"
    case comfortaaRegular = "Comfortaa-Regular"
    var name: String {
        return self.rawValue
    }
}
//
struct FontDescription {
    let font: Font
    let size: CGFloat
    let style: UIFont.TextStyle = .body
}
enum TextStyle {
    case largeTitle //30pt, Demibold
    case smallTitle //24pt, medium
    case simiTitle //28pt, medium
    case headline //14pt, regular
    case simiBoldHeadline //14pt, Demibold
    case mediumHeadline //14pt, medium
    case subheadline //14pt, Demibold
    case input //14pt, Demibold
    case paragraph //16pt, Regular
    case paragraphSmall //14pt, light

    case secondaryButton //16pt, Medium
    case primaryButton //16pt, Medium
    case tabStyle //10pt, Regular
    case searchStyle //13pt, Regular
    case description //10pt, Regular
    case error //12pt, Light
    case montesrtRegural18 //12pt, Light
    case montesrtSimil16 //16pt, Light
    case montesrtReg14 //14pt, Light

}
extension TextStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .largeTitle:
            return FontDescription(font: .montserratBold, size: 30)
        case .smallTitle:
            return FontDescription(font: .montserratMedium, size: 24)
        case .simiTitle:
            return FontDescription(font: .montserratSemiBold, size: 21)
        case .headline:
            return FontDescription(font: .montserratRegular, size: 14)
        case .simiBoldHeadline:
            return FontDescription(font: .montserratSemiBold, size: 14)
        case .mediumHeadline:
            return FontDescription(font: .montserratMedium, size: 14)
        case .input:
            return FontDescription(font: .montserratRegular, size: 14)
        case .paragraphSmall:
            return FontDescription(font: .montserratLight, size: 14)
        case .description:
            return FontDescription(font: .montserratMedium, size: 14)
        case .secondaryButton:
            return FontDescription(font: .montserratRegular, size: 14)
        case .paragraph:
            return FontDescription(font: .montserratRegular, size: 16)
        case .primaryButton:
            return FontDescription(font: .montserratMedium, size: 16)
        case .tabStyle:
            return FontDescription(font: .ralewayMedium, size: 10)
        case .subheadline:
            return FontDescription(font: .sFUIRegular, size: 10)
        case .searchStyle:
            return FontDescription(font: .comfortaaRegular, size: 13)
        case .error:
            return FontDescription(font: .montserratLight, size: 12)
        case .montesrtRegural18:
            return FontDescription(font: .montserratRegular, size: 18)
        case .montesrtSimil16:
            return FontDescription(font: .montserratSemiBold, size: 16)
        case .montesrtReg14:
        return FontDescription(font: .montserratRegular, size: 14)
        }
    }
}
extension TextStyle {
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
            return UIFont.preferredFont(forTextStyle: fontDescription.style)
        }
        let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
        return fontMetrics.scaledFont(for: font)
    }
}
