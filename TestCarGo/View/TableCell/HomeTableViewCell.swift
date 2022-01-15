//
//  HomeTableViewCell.swift
//  TestCarGo
//
//  Created by alaa on 15/01/2022.
//

import UIKit
protocol likeBtnCellDelegate : NSObjectProtocol {
    func cellButtonClicked()
    
}

class HomeTableViewCell: UITableViewCell {
   
    weak var delegate : likeBtnCellDelegate?
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var personalImage: UIImageView!
    @IBOutlet weak var likeAction: UIButton!
    @IBOutlet weak var postTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        personalImage.setImageRoundedCornersWithBorder(
            radius: 30,
            borderWitdth: nil,
            borderColor: nil,
            isShadow: true)
    }
    
    @IBAction func likebtn(_ sender: Any) {
        self.delegate?.cellButtonClicked()
    }
}
