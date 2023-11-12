//
//  ColumnNameCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/11/23.
//

import UIKit

class ColumnNameCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String) {
        textField.text = title
    }

}
