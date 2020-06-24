//
//  ViewController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let heightLabel: CGFloat = 50
        let widthLabel: CGFloat = 50
        let xCordinate = UIScreen.main.bounds.width - widthLabel
        let lCount = labelCount(heighLabel: heightLabel)
        
        
        for item in 0...lCount{
            let arrayItem = randomBackgroundKanji()
            let yCordinate = heightLabel * CGFloat(item)
            let rightLabel = rightSideLabel(labelText: arrayItem, xCor: xCordinate, yCor: yCordinate, heighLabel: heightLabel, widthLabel: widthLabel)
            view.addSubview(rightLabel)
        }
       
    }
    
    func labelCount (heighLabel: CGFloat) -> Int{
        let count = UIScreen.main.bounds.height / heighLabel
        return Int(count)
    }
    
    func rightSideLabel(labelText: String,xCor: CGFloat,yCor: CGFloat,heighLabel: CGFloat, widthLabel: CGFloat) -> UILabel{ // проверить возвращение и без
        let label = UILabel(frame: CGRect(x: xCor, y: yCor, width: widthLabel, height: heighLabel))
        label.textAlignment = .center
        label.text = labelText
        label.alpha = 1
        
        return label
    }
    
}
