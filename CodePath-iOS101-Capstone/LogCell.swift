//
//  LogCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/11/23.
//

import UIKit

class LogCell: UITableViewCell {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var s: Int!
    var c: Int!
    var l: Int!
    
    @IBAction func didLogTextEditEnd(_ sender: Any) {
        LogViewController.LogView.logEntryUpdateDelegate?.LogEntryUpdate(s: s,c: c,l: l,text: textField.text ?? "")
    }
    
    func configure(text: String, s: Int, c: Int, l: Int) {
        textField.text = text
        self.s = s
        self.c = c
        self.l = l
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
