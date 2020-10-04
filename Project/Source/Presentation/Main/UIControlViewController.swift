//
//  UIControlViewController.swift
//  Project
//
//  Created by ブラック狼 on 03.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit
import Foundation

class UIControlViewController: UIViewController {

    let buttom = UIButton(type: .system)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttom.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
        buttom.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.5882352941, blue: 0.4156862745, alpha: 1)
        let label = UILabel(frame: CGRect(x: 5, y: 5, width: 20, height: 20))
        label.text = "1"
        let label2 = UILabel(frame: CGRect(x: 25, y: 5, width: 20, height: 20))
        label2.text = "2"
        let label3 = UILabel(frame: CGRect(x: 45, y: 5, width: 20, height: 20))
        label3.text = "3"
        let label4 = UILabel(frame: CGRect(x: 65, y: 5, width: 20, height: 20))
        label4.text = "4"
        
        buttom.addTarget(self, action: #selector(test), for: .touchUpInside)
        
        buttom.addSubview(label)
        buttom.addSubview(label2)
        buttom.addSubview(label3)
        buttom.addSubview(label4)
        view.addSubview(buttom)
        
        
        
    }
    
    @objc func test(_ buttom: UIButton) {
        print("TEST")
    }
   
}

