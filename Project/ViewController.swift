//
//  ViewController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let heightOfLabel: CGFloat = 50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let countOfLabels = getCountOfLabels() // теперь тут количество лейблов на экране
        // необходимо сейчас поместить ихз всех на экарн, для этого в функцию label добавь ещё один параметр - Y, чтобы можно было регулировать координату начала
        
        label(labelText: "12", labelWidth: 50, labelHeight: heightOfLabel)
        
        let testPrint = getLabelsY(labelCount: 1, heightLabel: 50)
        print (testPrint)
        
    }

    func getCountOfLabels() -> Int {
        //UIScreen.main.bounds.height - высота всей вьюхи
        let count = Int( UIScreen.main.bounds.height / heightOfLabel ) // высота общей делить на высоту элемента ты получишь количество элементов которые влазят в экран перевести в инт, тк нужно целое количество
        
        return count
    }
    
    func getLabelsY(labelCount: Int, heightLabel: Int) -> CGFloat{// labelCount - строка, heightLabel - размер лейба
        var yCordinate = 10
        if labelCount > 1{
            for _ in 2...labelCount{
                yCordinate += heightLabel
            }}
        return CGFloat(yCordinate)
    }
    
    func label(labelText: String, labelWidth: CGFloat,labelHeight: CGFloat) {
        let label = UILabel(frame: CGRect(x: 10,y: 10, width: labelWidth, height: labelHeight))
        label.textAlignment = .center
        label.text = labelText
        label.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.view.addSubview(label)
    }
}

