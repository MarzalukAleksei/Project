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
        
        let heightOfLabel: CGFloat = 50
        
        let countOfLabels = getCountOfLabels(heightOfLabel: heightOfLabel) // теперь тут количество лейблов на экране
        // необходимо сейчас поместить ихз всех на экарн, для этого в функцию label добавь ещё один параметр - Y, чтобы можно было регулировать координату начала

        for value in 0...countOfLabels { 
            let arrayItem = randomBackgroundKanji()
            let y = heightOfLabel * CGFloat(value)
            label(labelText: arrayItem, labelWidth: 50, labelHeight: heightOfLabel, yCordinate: y)
        }
    }
    
    func getCountOfLabels(heightOfLabel: CGFloat) -> Int {
        //UIScreen.main.bounds.height - высота всей вьюхи
        let count = Int( UIScreen.main.bounds.height / heightOfLabel ) // высота общей делить на высоту элемента ты получишь количество элементов которые влазят в экран перевести в инт, тк нужно целое количество
        return count
    }
    
    func label(labelText: String, labelWidth: CGFloat,labelHeight: CGFloat,yCordinate: CGFloat) {
        let label = UILabel(frame: CGRect(x: 10,y: yCordinate, width: labelWidth, height: labelHeight))
        label.textAlignment = .center
        label.text = labelText
        label.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.view.addSubview(label)
    }
}

