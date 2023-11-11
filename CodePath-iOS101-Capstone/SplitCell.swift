//
//  SplitCell.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import UIKit

class SplitCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var split: Split!
    
    func configure(with split: Split) {
        collectionView.dataSource = self
        // 1.
        self.split = split
        // 2.
        update(with: split)
    }
    
    override func awakeFromNib() {
        // Set the layout of the collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 180)
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        // Set the data source
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func update(with split: Split) {
        // 1.
        titleLabel.text = split.title
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
    }
    
}

extension SplitCell: UICollectionViewDelegate{
    
}

extension SplitCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:128, height:128)
    }
    
}

extension SplitCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return split.columns.count
    }
    
    // Instantiate column cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColumnCell", for: indexPath) as! ColumnCell
    
        // Configure the cell
        let column = split.columns[indexPath.row]
        cell.configure(with: column)
        return cell
    }
    
    
}

