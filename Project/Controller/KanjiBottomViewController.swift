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
            destinasion.typeOfCollection = TypeOfCollectionItem.kanji
        case "n2Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanji
        case "n3Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanji
        case "n4Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanji
        case "n5Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanji
        default: break
            
        }
    }
}
