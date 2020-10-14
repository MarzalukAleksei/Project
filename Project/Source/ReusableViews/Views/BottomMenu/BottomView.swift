//
//  BottomView.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/14/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

protocol BottomViewDelegate {
    func backButtonAction()
}

class BottomView: UIView {
    
    var delegate: BottomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(name: String(describing: BottomView.self))
    }
    
    @IBAction private func backButtonAction(_ sender: UIButton) {
        delegate?.backButtonAction()
    }
}

