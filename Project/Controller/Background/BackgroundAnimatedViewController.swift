//
//  BackgroundAnimatedViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class BackgroundAnimatedViewController: UIViewController {
    
    private let widthOfLabel = backgroundlabelwidth
    private let heightOfLabel = backgroundlabelHeight
    private let firstCordinate = backgoundStartConrdinate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
    }
    
    private func createLabel() {
        let countOfLabels = getCountOfLabels(heightOfLabel: heightOfLabel) // теперь тут количество лейблов на экране
                // необходимо сейчас поместить ихз всех на экарн, для этого в функцию label добавь ещё один параметр - Y, чтобы можно было регулировать координату начала
        let kanji = KanjiSetter()
        for value in 0...countOfLabels {
            guard let arrayItem = kanji.setKanji().randomElement()?.body else { return }
            let y = heightOfLabel * CGFloat(value)
            let newLabel = label(labelText: arrayItem, labelWidth: widthOfLabel, labelHeight: heightOfLabel, yCordinate: y, xCordinate: randomFloat(from: firstCordinate, to: UIScreen.main.bounds.width))
           
            view.addSubview(newLabel)
            view.sendSubviewToBack(newLabel)
            animateLabel(label: newLabel,duration: Double(randomFloat(from: backgroundAnimateDurationFrom, to: backgroundAnimateDurationTo)) )// добавили сюда, массив в принципе не особо нужен как оказалось
        }
    }
            
    private func animateLabel(label: UILabel, duration: Double){
        UIView.animate(withDuration: duration, animations: {
            label.frame.origin.x = self.view.frame.width // те указали что Х = ширине(длинне) экрана, не путай с высотой - height
        }) { (_) in
                // здесь будет выполняться то, когда закончится анимация
            label.frame.origin.x = self.firstCordinate
            self.animateLabel(label: label, duration: duration)
        }
    }
    
    private func getCountOfLabels(heightOfLabel: CGFloat) -> Int {
            //UIScreen.main.bounds.height - высота всей вьюхи
        let count = Int( UIScreen.main.bounds.height / heightOfLabel ) // высота общей делить на высоту элемента ты получишь количество элементов которые влазят в экран перевести в инт, тк нужно целое количество
        return count
    }
                
    private func label(labelText: String, labelWidth: CGFloat,labelHeight: CGFloat,yCordinate: CGFloat, xCordinate: CGFloat) -> UILabel{
        let label = UILabel(frame: CGRect(x: xCordinate,y: yCordinate, width: labelWidth, height: labelHeight))
        label.textAlignment = .center
        label.text = labelText
        label.alpha = randomFloat(from: 0.40, to: 0.85)
        label.font.withSize(randomFloat(from: 15, to: 49))
        return label
    }
}
