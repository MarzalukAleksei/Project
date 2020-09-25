//
//  KanjiBottomViewController.swift
//  Project
//
//  Created by ブラック狼 on 24.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanjiBottomViewController: BackgroundSymbolsFullViewController {

    @IBOutlet private var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = designBackgroundColor
        loadDesign()
    }
    
    private func loadDesign() {
        buttons.forEach { (button) in
            button.backgroundColor = designElementColor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinasion = segue.destination as? KanaCollectionViewController, let typeOfSegue = segue.identifier else { return }
        let typeOfCollection = TypeOfCollectionItem(rawValue: typeOfSegue)
        destinasion.typeOfCollection = typeOfCollection
    }
}
