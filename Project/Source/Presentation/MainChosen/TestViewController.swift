//
//  TestViewController.swift
//  Project
//
//  Created by ブラック狼 on 05.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labeltwo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = image.bounds.width * 0.2
    }
    

}

