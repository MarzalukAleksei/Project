//
//  KanjiBottomViewController.swift
//  Project
//
//  Created by ブラック狼 on 24.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanjiBottomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "n1Segue" {
            guard let destination = segue.destination as? KanaCollectionViewController else { return }
            destination.typeOfCollection = TypeOfCollectionItem.kanji
        }
    }
}
