//
//  WordLearningViewController.swift
//  Project
//
//  Created by ブラック狼 on 21.12.2021.
//  Copyright © 2021 ブラック狼. All rights reserved.
//

import UIKit

class WordLearningViewController: UIViewController {

    
    @IBOutlet weak var canvas: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBAction func check(_ sender: Any) {
        let allert = UIAlertController(title: main.kana, message: main.translate, preferredStyle: .actionSheet)
        allert.addAction(UIAlertAction(title: "Верно", style: .default, handler: { _ in self.setElement() }))
        allert.addAction(UIAlertAction(title: "Неверно", style: .destructive))
        present(allert, animated: true)
    }
    
    var main = VocabularyModel(kanji: "", kana: "", translate: "", level: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.font = UIFont.systemFont(ofSize: mainLabel.bounds.height / 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setElement()
    }
    
    func setElement() {
        main = getWord()
        while main.kanji == "" {
            main = getWord()
        }
        mainLabel.text = main.kanji
    }
    
    func getWord() -> VocabularyModel {
        return Stores.shared.vocabularyStore.getData().randomElement() ?? VocabularyModel(kanji: "", kana: "", translate: "", level: 0)
    }
    
    
}

