//
//  LaunchController.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {

    let launchScreenInteractor = LaunchScreenInteractor(kanaMapper: KanaMapper(csvMapper: CSVMapper()), csvRepository: CSVRepository(manager: CSVManager()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchScreenInteractor.readFiles(completion: { [weak self] value in
            guard let weakSelf = self else { return }
            weakSelf.navigationController?.pushViewController(ViewControllers.main, animated: true)
        })
    }
}
