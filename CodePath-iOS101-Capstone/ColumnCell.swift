//
//  ColumnCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/10/23.
//

import UIKit

// Called when the a log is added/removed to the database
// Used to update the Log Table
protocol LogUpdateDelegate: AnyObject {
    func logViewDidUpdate()
}


class ColumnCell: UICollectionViewCell, UITableViewDelegate, LogUpdateDelegate {
    weak var scrollDelegate: LogScrollDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var column: Column!
    
    func logViewDidUpdate() {
        reloadLogs()
    }
    
    override func awakeFromNib() {
        tableView.dataSource = self
        tableView.delegate = self
        LogViewController.LogView.logUpdateDelegate = self
    }
    
    
    func configure(with column: Column) {
//        print("configure " + column.title)
        self.column = column
        titleLabel.text = column.title
        
        tableView.reloadSections(IndexSet(integer: 0), with: .none)
        
    }
    
    func reloadLogs() {
        print("Reload Logs! count: ", column.logs.count)
        tableView.reloadSections(IndexSet(integer: 0), with: .none)
    }
}

extension ColumnCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("log count", column.logs.count, " logs | Log Count:", Split.getLogCount())
        return column.logs.count
    }
    
    // Spawn Log Entry
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath) as! LogCell
        // Configure the cell
        let log = column.logs[indexPath.row]
        cell.configure(text: log)

        return cell

    }
    
    
}

extension ColumnCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("Scroll")
        // Here, you get the vertical offset of the collection view's content
        let yOffset = scrollView.contentOffset.y
        
        scrollDelegate?.logViewDidScroll(self.tableView, yOffset: yOffset)
//
//        // Iterate through visible cells in the collection view
//        for cell in collectionView.visibleCells {
//            // Assuming your table view is a subview of the collection view cell
//            if let tableView = cell.contentView.viewWithTag(yourTableViewTag) as? UITableView {
//                // Update the content offset of the table view to sync with the collection view
//                tableView.contentOffset.y = yOffset
//            }
//        }
    }
}

