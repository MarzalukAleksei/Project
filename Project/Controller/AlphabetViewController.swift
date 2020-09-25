//
//  AlphabetViewController.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class AlphabetViewController: BackgroundSymbolsFullViewController {

    @IBOutlet weak var hiraganaButtom: UIButton!
    @IBOutlet weak var katakanaButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDesign()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hiraganaSegue" {
            guard let destitantion = segue.destination as? KanaCollectionViewController else { return }
                destitantion.typeOfCollection = TypeOfCollectionItem.hiragana
        } else if segue.identifier == "katakanaSegue" {
            guard let destitantion = segue.destination as? KanaCollectionViewController else { return }
            destitantion.typeOfCollection = TypeOfCollectionItem.katakana
        }
    }
    
    private func loadDesign() {
        view.backgroundColor = designBackgroundColor
        hiraganaButtom.backgroundColor = designElementColor
        katakanaButtom.backgroundColor = designElementColor
    }
}
