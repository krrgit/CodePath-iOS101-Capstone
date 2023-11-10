//
//  SplitCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import UIKit

class SplitCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var split: Split!
    
    func configure(with split: Split) {
        // 1.
        self.split = split
        // 2.
        update(with: split)
    }
    
    private func update(with split: Split) {
        // 1.
        titleLabel.text = split.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }

}
