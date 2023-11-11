//
//  ColumnCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/10/23.
//

import UIKit

class ColumnCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var column: Column!
    
    static let identifier = "ColumnCell"
    static func nib() -> UINib {
        return UINib(nibName: "ColumnCell", bundle: nil)
    }
    
    func configure(with column: Column) {
        print("configure " + column.title)
        self.column = column
        titleLabel.text = column.title
    }
}
