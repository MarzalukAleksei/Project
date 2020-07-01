//
//  AlphabetViewController.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class AlphabetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        kanaBackgroundLabel()
    }
    
    
    func kanaBackgroundLabel(){
        let labelWidth: CGFloat = 60
        let labelHeigth: CGFloat = 60
        
        
        
        for horizontalItem in 0...horizontalCount(labelWidth: labelWidth){
            for verticalItem in 0...verticalCount(labelheigh: labelHeigth){
                let x = labelWidth * CGFloat(horizontalItem)
                let y = labelHeigth * CGFloat(verticalItem)
                if verticalItem % 2 == 0 {
                    let label = createLabel(xCor: x, yCor: y, width: labelWidth, height: labelHeigth, text: randomKana(selectKana: katakana))
                    view.addSubview(label)
                }else{
                    let newLabel = createLabel(xCor: x, yCor: y, width: labelWidth, height: labelHeigth, text: randomKana(selectKana: hiragana))
                    view.addSubview(newLabel)}
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
    
    func createLabel(xCor: CGFloat,yCor: CGFloat,width: CGFloat,height: CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: xCor, y: yCor, width: width, height: height))
        label.text = text
        label.textAlignment = .center
        
        
        return label
    }
    
    
    
    
    
}
