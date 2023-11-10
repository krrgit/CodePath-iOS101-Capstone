//
//  SplitCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import UIKit

class SplitCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logHeaderView: UIView!
    @IBOutlet weak var logTableView: UITableView!
    
    @IBOutlet weak var logTableContainerView: UIView!
    @IBOutlet weak var logTableContainerWidthConstraint: NSLayoutConstraint!
    
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
        // 2.
        createWorkoutLabels()
        logTableView.tableHeaderView = logHeaderView
        
    }
    
    private func createWorkoutLabels() {
        var index: Int = 0
        let width: Int = 90
        
        for workout in split.exercises {
            let label = UILabel()
            
            // Set the text for the label
            label.text = workout
            print("make " + workout)
            
            // Set the frame (position and size) for the label
            label.frame = CGRect(x:index * width, y: 0, width: width, height: 30)

            // Add the label to the view
            logHeaderView.addSubview(label)
            index += 1
        }
        
        var newFrame = logTableView.frame
        newFrame.size.width = CGFloat((index+1)*width)
        
        logTableContainerWidthConstraint.constant = CGFloat(index*width)

        logTableView.frame = newFrame
        // Update the width of the container view of the log table
        UIView.animate(withDuration: 0.3) {
            self.logTableContainerView.layoutIfNeeded()
            self.logTableView.layoutIfNeeded()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }

}
