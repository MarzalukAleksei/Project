//
//  MainBarViewController.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/4/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class MainBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
