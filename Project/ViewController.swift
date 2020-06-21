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
        var a = 1
        for _ in 1...3{
            label(labelText: "11", labelWidth: 50, labelHeight: 50, yCordinate: getLabelsY(labelCount: a, heightLabel: 50))
            a += a
        }
        
        label(labelText: "12", labelWidth: 50, labelHeight: heightOfLabel, yCordinate: 80)
        
       
        
    }

//    func backGround(yElement: Int) {
//        var
//        for yCord in 1...yElement{
//            label(labelText: "12", labelWidth: 50, labelHeight: heightOfLabel, yCordinate: getLabelsY(labelCount: yElement, heightLabel: 50))
//
//        }
//
//    }
    
    func getCountOfLabels() -> Int {
        //UIScreen.main.bounds.height - высота всей вьюхи
        let count = Int( UIScreen.main.bounds.height / heightOfLabel ) // высота общей делить на высоту элемента ты получишь количество элементов которые влазят в экран перевести в инт, тк нужно целое количество
        
        return count
    }
    
    func getLabelsY(labelCount: Int, heightLabel: Int) -> CGFloat{// labelCount - строка, heightLabel - размер лейба для отступа
        var yCordinate = 50
        if labelCount > 1{
            for _ in 2...labelCount{
                yCordinate += heightLabel
            }}
        return CGFloat(yCordinate)
    }
    
    func label(labelText: String, labelWidth: CGFloat,labelHeight: CGFloat,yCordinate: CGFloat) {
        let label = UILabel(frame: CGRect(x: 10,y: yCordinate, width: labelWidth, height: labelHeight))
        label.textAlignment = .center
        label.text = labelText
        label.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.view.addSubview(label)
    }
}

