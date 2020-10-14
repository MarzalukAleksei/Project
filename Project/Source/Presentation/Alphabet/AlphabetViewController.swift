//
//  AlphabetViewController.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class AlphabetViewController: BackgroundSymbolsFullViewController {

    @IBOutlet private weak var hiraganaButtom: UIButton!
    @IBOutlet private weak var katakanaButtom: UIButton!
    @IBOutlet private weak var bottomView: BottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDesign()
        setupView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hiraganaSegue" {
            guard let destitantion = segue.destination as? KanaViewController else { return }
                destitantion.typeOfCollection = TypeOfCollectionItem.hiragana
        } else if segue.identifier == "katakanaSegue" {
            guard let destitantion = segue.destination as? KanaViewController else { return }
            destitantion.typeOfCollection = TypeOfCollectionItem.katakana
        }
    }
    
    private func setupView() {
        bottomView.delegate = self
    }
    
    private func loadDesign() {
        navigationController?.navigationBar.isHidden = true
    }
}

extension AlphabetViewController: BottomViewDelegate {
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
