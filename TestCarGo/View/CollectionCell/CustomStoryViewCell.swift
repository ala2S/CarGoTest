//
//  CustomStoryViewCell.swift
//  TestCarGo
//
//  Created by alaa on 15/01/2022.
//

import UIKit

class CustomStoryViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondimage: UIImageView!
    @IBOutlet weak var whitBackGround: UIView!
    @IBOutlet weak var smallCirclView: UIView!
    @IBOutlet weak var smallimageview: UIImageView!
    @IBOutlet weak var colorBackGround: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        colorBackGround.setUiViewRoundedCornersWithShadow(
            radius: 30,
            borderWidth: 0,
            borderColor: nil,
            backGroundColor: Theme.currentTheme.themeBlueColor,
            isShadow: false)
        
        
        whitBackGround.setUiViewRoundedCornersWithShadow(
            radius: 25,
            borderWidth: 0,
            borderColor: nil,
            backGroundColor: Theme.currentTheme.themeWhiteColor,
            isShadow: false)
        
        smallCirclView.setUiViewRoundedCornersWithShadow(
            radius: 10,
            borderWidth: 0,
            borderColor: nil,
            backGroundColor: Theme.currentTheme.themeWhiteColor,
            isShadow: false)
        
        
        image.setImageRoundedCornersWithBorder(
            radius: 22.5,
            borderWitdth: nil,
            borderColor: nil,
            isShadow: false)
        
        smallimageview.setImageRoundedCornersWithBorder(
            radius: 9,
            borderWitdth: nil,
            borderColor: nil,
            isShadow: false)
        
        
        secondView.setUiViewRoundedCornersWithShadow(
            radius: 25,
            borderWidth: 0,
            borderColor: nil,
            backGroundColor: Theme.currentTheme.themeWhiteColor,
            isShadow: false)
        
        
        secondimage.setImageRoundedCornersWithBorder(
            radius: 22.5,
            borderWitdth: nil,
            borderColor: nil,
            isShadow: false)
        
    }
}
