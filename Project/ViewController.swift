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
        print (width())
        label(labelText: "12", labelWidth: 50, labelHeight: 50)
        
    }
    
    func getCountOfLabels() -> Int {
        //UIScreen.main.bounds.height - высота всей вьюхи
        let count = Int( UIScreen.main.bounds.height / 50 ) // высота общей делить на высоту элемента ты получишь количество элементов которые влазят в экран перевести в инт, тк нужно целое количество
        
        return count
    }
    
    func width() -> Int{
    var screenWidth: Int {
        return Int(UIScreen.main.bounds.width / 50)
        }
        return screenWidth
    }
    
    func height() {
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height / 50
        }
    }
    
    
    
    
    
    
    func label(labelText: String, labelWidth: Int,labelHeight: Int) {
        
    let label = UILabel(frame: CGRect(x: 10,y: 10,width: labelWidth,height: labelHeight))
    label.center = CGPoint(x: 30,y: 50)
    label.textAlignment = .center
    label.text = labelText
    label.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    self.view.addSubview(label)

    }
    
    

}

