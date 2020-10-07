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
    @IBOutlet weak var image: UIImageView!
    
    
    
    
    let recogniser = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recogniser.addTarget(self, action: #selector(test))
        
        
        customButtom.firstLabel.text = "label1"
        customButtom.secondLabel.text = "label1"
        image.layer.cornerRadius = image.bounds.width * 0.2
        
        
    }
    
    @objc func test() {
        print("Yes")
    }
    
    
}

