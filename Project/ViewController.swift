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
        
        
        func label(){
            
            
        let label = UILabel(frame: CGRect(x: 10,y: 10,width: 50,height: 50))
        label.center = CGPoint(x: 150,y: 150)
        label.textAlignment = .center
        label.text = "1"
        self.view.addSubview(label)
        
        }
        
        label()
        
    }
    

}

