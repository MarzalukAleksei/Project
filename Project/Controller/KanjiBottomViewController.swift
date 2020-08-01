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
        switch segue.identifier {
        case "n1Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN1
        case "n2Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN2
        case "n3Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN3
        case "n4Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN4
        case "n5Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN5
        case "AllSegue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiAll
        default: break
            
        }
    }
}
