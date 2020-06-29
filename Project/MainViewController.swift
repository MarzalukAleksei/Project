//
//  ViewController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLabel()
        
        
}
    
    
            
      

    func createLabel() {
            let widthOfLabel: CGFloat = 50
            let heightOfLabel: CGFloat = 50
//            let xCordinate: CGFloat = -50
        
            
        
            let countOfLabels = getCountOfLabels(heightOfLabel: heightOfLabel) // теперь тут количество лейблов на экране
            // необходимо сейчас поместить ихз всех на экарн, для этого в функцию label добавь ещё один параметр - Y, чтобы можно было регулировать координату начала
           
        
        
//        let countXLabels = countXCorLabels(widthLabel: widthLabel)
        
        
          //  var labelArray: [UILabel] = []
            
            
            for value in 0...countOfLabels {
                let arrayItem = randomBackgroundKanji()
                let y = heightOfLabel * CGFloat(value)
                let newLabel = label(labelText: arrayItem, labelWidth: widthOfLabel, labelHeight: heightOfLabel, yCordinate: y, xCordinate: randomScreenPointWidth())
             //   labelArray.append(newLabel)
                view.addSubview(newLabel)
                animateLabel(label: newLabel,duration: randomTwentyHundred() )// добавили сюда, массив в принципе не особо нужен как оказалось
            }
           
        
        }
        
    
    func animateLabel(label: UILabel, duration: Double){
        
        UIView.animate(withDuration: duration, animations: {
            label.frame.origin.x = self.view.frame.width // те указали что Х = ширине(длинне) экрана, не путай с высотой - height
        }) { (_) in
            // здесь будет выполняться то, когда закончится анимация
            label.frame.origin.x = -50
            self.animateLabel(label: label, duration: duration)
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
