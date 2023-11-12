//
//  LogCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/11/23.
//

import UIKit

class LogCell: UITableViewCell {
    
    
    @IBOutlet weak var textField: UITextField!
    func configure(text: String) {
        textField.text = text
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
