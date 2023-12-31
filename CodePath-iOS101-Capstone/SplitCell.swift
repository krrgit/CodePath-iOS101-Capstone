//
//  SplitCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import UIKit

protocol LogScrollDelegate: AnyObject {
    func logViewDidScroll(_ tableView: UITableView, yOffset: Double)
}


class SplitCell: UITableViewCell, LogScrollDelegate {
    // Syncronizes the scrolls between the log tables
    func logViewDidScroll(_ tableView: UITableView, yOffset: Double) {
        for cell in collectionView.visibleCells {
            if let column = cell as? ColumnCell {
                column.tableView.contentOffset.y = yOffset
            }
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var split: Split!
    var s: Int!
    
    override func awakeFromNib() {
        // Set the layout of the collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
//        flowLayout.itemSize = CGSize(width: 110, height: 132)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 2.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        // Set the data source
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    func configure(with split: Split, s: Int) {
        collectionView.dataSource = self
        // 1.
        self.split = split
        self.s = s
        // 2.
        update(with: split)
        
        collectionView.reloadData()
    }
    
       
    private func update(with split: Split) {
        // 1.
        titleLabel.text = split.title
        // 2.
        setCollectionViewHeight()
    }
    
    private func setCollectionViewHeight() {
        let headerHeight = 29
        var logCount = Split.getLogCount()
        logCount = logCount == 0 ? 1 : logCount
        let logHeight = 30
        
        var size = collectionView.frame.size
        size.height = CGFloat(headerHeight + (logCount*logHeight))
        collectionView.frame.size = size
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
}

extension SplitCell: UICollectionViewDelegateFlowLayout {
    // Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if (split.columns[indexPath.row].title == "Log #") {
//            return CGSize(width:64, height:128)
//
//        }
//        return CGSize(width: 110, height: 132)
        print("🍏 collectionView height:", collectionView.visibleSize.height)
        return CGSize(width: 110, height: collectionView.visibleSize.height)
    }
    
}

extension SplitCell: UICollectionViewDataSource {
    // # of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("split columns count: ", split.columns.count)
        return split.columns.count
    }
    
    // Instantiate column cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColumnCell", for: indexPath) as! ColumnCell
        
        // Configure the cell
        let column = split.columns[indexPath.row]
        cell.configure(with: column, s: self.s, c: indexPath.row)
        
        // Subscribe scrollDelegate to all the scroll events of all tables
        // This will keep the scroll of all tables in sync
        cell.scrollDelegate = self

        return cell
    }
    
    
}

extension SplitCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Here, you get the vertical offset of the collection view's content
        let yOffset = scrollView.contentOffset.y
        
        
        // Iterate through visible cells in the collection view
        for cell in collectionView.visibleCells {
            // Assuming your table view is a subview of the collection view cell
            if let tableView = cell.contentView.viewWithTag(1010) as? UITableView {
                // Update the content offset of the table view to sync with the collection view
                tableView.contentOffset.y = yOffset
            }
        }
    }
}
