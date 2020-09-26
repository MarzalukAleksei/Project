//
//  SearchTableViewCell.swift
//  Project
//
//  Created by ブラック狼 on 26.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var kanjiBody: UILabel!
    @IBOutlet weak var kanjiReading: UILabel!
    @IBOutlet weak var kanjiTranslate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
