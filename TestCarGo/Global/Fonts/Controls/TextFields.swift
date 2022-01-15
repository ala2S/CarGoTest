//
//  TextFields.swift
//  StarterProject
//
//  Created by Adel Aref on 14/09/2021.
//

import Foundation
import UIKit

class PrimaryTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.borderStyle = .roundedRect
        self.textAlignment = .natural
        self.textColor = .white
        self.font = TextStyle.input.font
        self.backgroundColor = .white
    }
}
class ErrorTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 5
        self.borderStyle = .roundedRect
        self.textAlignment = .natural
       
        self.textColor = .white
        self.font = TextStyle.input.font
        self.backgroundColor = .white
    }
}
class SearchTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textColor = .white
        self.font = TextStyle.searchStyle.font
    }
}
