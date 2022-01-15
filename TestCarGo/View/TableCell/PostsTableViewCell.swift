//
//  PostsTableViewCell.swift
//  TestCarGo
//
//  Created by Hamilton on 15/01/2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postTxt: UILabel!
    
    @IBOutlet weak var postimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        postimage.setImageRoundedCornersWithBorder(
            radius: 25,
            borderWitdth: nil,
            borderColor: nil,
            isShadow: false)
    }
    
}
