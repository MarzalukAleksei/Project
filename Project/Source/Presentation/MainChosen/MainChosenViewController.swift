//
//  MainChosenController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

protocol TestControl {
    func touchUp()
    func touchDown()
}

extension UIControl {
    
}

class MainChosenViewController: BackgroundAnimatedViewController {
    
    @IBOutlet weak var controlButton: UIButton!
    
    @IBOutlet var labels: [UILabel]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlButton.addTarget(self, action: #selector(control), for: .touchUpInside)
        controlButton.addTarget(self, action: #selector(touchDown), for: .touchDown)
        
    }
    
    @objc func control(_ buttom: UIButton) {
        
    }
    
    @objc func touchDown(_ bottom: UIButton) {
        
    }
}
