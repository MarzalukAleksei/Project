//
//  SearchTableViewCell.swift
//  Project
//
//  Created by ブラック狼 on 26.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet private weak var kanjiLabel: UILabel!
    @IBOutlet private weak var readingLabel: UILabel!
    @IBOutlet private weak var translateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupElements(kanji: String, reading: String, translate: String) {
        kanjiLabel.text = kanji
        readingLabel.text = reading
        translateLabel.text = translate
    }

}
