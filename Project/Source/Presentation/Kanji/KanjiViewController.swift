//
//  KanjiViewController.swift
//  Project
//
//  Created by ブラック狼 on 24.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanjiViewController: BackgroundSymbolsFullViewController {

    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet private weak var bottomView: BottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }
    
    private func prepareViewController() {
        bottomView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinasion = segue.destination as? KanaViewController, let typeOfSegue = segue.identifier else { return }
        let typeOfCollection = TypeOfCollectionItem(rawValue: typeOfSegue)
        destinasion.typeOfCollection = typeOfCollection
    }
}

