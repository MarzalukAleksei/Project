//
//  BackgroundSymbolsFullViewController.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/25/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class BackgroundSymbolsFullViewController: UIViewController {
    
    private let widthOfLabel: CGFloat = 30
    private let heightOfLabel: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kanaBackgroundLabel()
    }
    
    func kanaBackgroundLabel() {
        let labelWidth = widthOfLabel
        let labelHeigth = heightOfLabel
        let kana = KanaSetter()

        let horizontal = horizontalCount(labelWidth: labelWidth)
        let vertical = verticalCount(labelheigh: labelHeigth)
        let katakana = kana.transformToKana(.katakana)
        let hiragana = kana.transformToKana(.hiragana)
        for horizontalItem in 0...horizontal {
            for verticalItem in 0...vertical {
                let x = labelWidth * CGFloat(horizontalItem)
                let y = labelHeigth * CGFloat(verticalItem)
                let arrayOfItems = verticalItem % 2 == 0 ? katakana : hiragana
                guard let object = arrayOfItems.randomElement() else {
                    return
                }
                let newLabel = createLabel(xCor: x, yCor: y, width: labelWidth, height: labelHeigth, text: object.kana)
                view.addSubview(newLabel)
                view.sendSubviewToBack(newLabel)
            }
        }
    }
    
    func verticalCount(labelheigh: CGFloat) -> Int {
        let count = UIScreen.main.bounds.height / labelheigh
        return Int(count)
    }
    
    func horizontalCount(labelWidth: CGFloat) -> Int {
        let count = UIScreen.main.bounds.width / labelWidth
        return Int(count)
    }
    
    func createLabel(xCor: CGFloat, yCor: CGFloat, width: CGFloat, height: CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: xCor, y: yCor, width: width, height: height))
        label.text = text
        label.textAlignment = .center
        return label
    }
}
