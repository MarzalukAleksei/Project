//
//  UILabel.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/26/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(labelText: String, labelWidth: CGFloat,labelHeight: CGFloat,yCordinate: CGFloat, xCordinate: CGFloat, widthSize: CGFloat, alpha: CGFloat) {
        self.init()
        self.frame = CGRect(x: xCordinate,y: yCordinate, width: labelWidth, height: labelHeight)
        self.textAlignment = .center
        self.text = labelText
        self.alpha = alpha 
        self.font.withSize(widthSize) 
    }
}
