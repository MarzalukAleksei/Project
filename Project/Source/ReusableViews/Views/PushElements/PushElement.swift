//
//  PushElement.swift
//  Project
//
//  Created by ブラック狼 on 06.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class PushElement: UIView {
    
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func setupButtons(symbol: String, description: String) {
        symbolLabel.text = symbol
        descriptionLabel.text = description
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(name: String(describing: PushElement.self))
    }
}

