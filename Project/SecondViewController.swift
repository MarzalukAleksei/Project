//
//  SecondViewController.swift
//  Project
//
//  Created by ブラック狼 on 21.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let heightOfLabel: CGFloat = 50
            let widthOfLabel: CGFloat = 50
            let xCordinate: CGFloat = 10
            
            let countOfLabels = getCountOfLabels(heightOfLabel: heightOfLabel) // теперь тут количество лейблов на экране
            // необходимо сейчас поместить ихз всех на экарн, для этого в функцию label добавь ещё один параметр - Y, чтобы можно было регулировать координату начала
            
            
            
            for value in 0...countOfLabels {
                let arrayItem = randomBackgroundKanji()
                let y = heightOfLabel * CGFloat(value)
                let newLabel = label(labelText: arrayItem, labelWidth: widthOfLabel, labelHeight: heightOfLabel, yCordinate: y, xCordinate: xCordinate)
                view.addSubview(newLabel)
                
            }
        }
        
        func getCountOfLabels(heightOfLabel: CGFloat) -> Int {
            //UIScreen.main.bounds.height - высота всей вьюхи
            let count = Int( UIScreen.main.bounds.height / heightOfLabel ) // высота общей делить на высоту элемента ты получишь количество элементов которые влазят в экран перевести в инт, тк нужно целое количество
            return count
        }
        
        func label(labelText: String, labelWidth: CGFloat,labelHeight: CGFloat,yCordinate: CGFloat, xCordinate: CGFloat) -> UILabel{
            let label = UILabel(frame: CGRect(x: xCordinate,y: yCordinate, width: labelWidth, height: labelHeight))
            label.textAlignment = .center
            label.text = labelText
            label.alpha = randomOne()
            label.font.withSize(randomTwo())
            return label
        
}
}
