//
//  MainChosenController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit


class MainChosenViewController: BackgroundAnimatedViewController {
    
    @IBOutlet weak var customButtom: PushElement!
    
    let recogniser = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recogniser.addTarget(self, action: #selector(test))
        
        customButtom.firstLabel.text = "label1"
        customButtom.secondLabel.text = "label1"
        customButtom.addGestureRecognizer(recogniser)
    }
    
    @objc func test() {
        print("Yes")
    }
    
    
}

