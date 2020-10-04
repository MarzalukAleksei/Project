//
//  LaunchViewController.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    let launchScreenInteractor = LaunchScreenInteractor(csvMapper: CSVMapper(), csvRepository: CSVRepository(manager: CSVManager()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        launchScreenInteractor?
    }
}
