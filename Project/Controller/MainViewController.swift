//
//  ViewController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class MainViewController: BackgroundViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(readFile())
//        print(cleanCSV(File: readFile()))
//        print(getArrayCSV()) // MARK: Test print
//        print(separateStringToArray(string: cleanCSV(File: readFile())))
        convertCSV(file: readFile())
        print(titles)
        print(data.first)
}
}
