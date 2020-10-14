//
//  CollectionViewCell.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanaCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet private weak var itemLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupLabelText(text: String) {
        itemLabel.text = text
    }
    
}
