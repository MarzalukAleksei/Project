//
//  SearchDetailTableViewCell.swift
//  Project
//
//  Created by ブラック狼 on 13.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchDetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupElement(string: String) {
        label.text = string
    }
}
