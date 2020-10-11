//
//  UIView.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/11/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension UIView  {
    func loadFromNib(name: String) {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
