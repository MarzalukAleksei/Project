//
//  NewViewController.swift
//  Project
//
//  Created by ブラック狼 on 09.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var buttonsView: FourButtom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    private func setup() {
        buttonsView.layer.cornerRadius = buttonsView.bounds.width * 0.2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}
