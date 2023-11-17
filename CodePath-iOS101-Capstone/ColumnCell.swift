//
//  ColumnCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/10/23.
//

import UIKit




class ColumnCell: UICollectionViewCell, UITableViewDelegate{
    weak var scrollDelegate: LogScrollDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var column: Column!
    var s: Int!
    var c: Int!
    
    override func awakeFromNib() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func configure(with column: Column, s: Int, c: Int) {
        self.column = column
        self.s = s
        self.c = c
        titleLabel.text = column.title
        
//        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        tableView.reloadData()
    }
    
    func reloadLogs() {
        print("Reload Logs! count: ", column.logs.count)
        tableView.reloadSections(IndexSet(integer: 0), with: .none)
    }
}

extension ColumnCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("log count", column.logs.count, " logs | Log Count:", Split.getLogCount())
        return column.logs.count
    }
    
    // Spawn Log Entry
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath) as! LogCell
        // Configure the cell
        let log = column.logs[indexPath.row]
        cell.configure(text: log, s: s, c: c, l: indexPath.row)

        return cell
    }
}

extension ColumnCell: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Here, you get the vertical offset of the collection view's content
        let yOffset = scrollView.contentOffset.y
        
        // Call the delegate to update the scroll position of other cells
        scrollDelegate?.logViewDidScroll(self.tableView, yOffset: yOffset)
    }
}

