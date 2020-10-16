//
//  SearchDetailViewController.swift
//  Project
//
//  Created by ブラック狼 on 12.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: BottomView!
    
    var mainElement: Any?
    var twoDemensionalArray: [Section: [Any]] = [:]
    let kanji = KanjiSetter()
    let kana = KanaSetter()
    var kanaList = ""
    
    
    enum Section: Int {
        case main = 0
        case containsKanji = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbleViewParameters()
        kanaListSetup()
        searchElementsForArray()
        
    }
    
    private func tabbleViewParameters() {
        bottomView.delegate = self
        tableView.register(UINib(nibName: "SearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchDetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func searchElementsForArray() {
        guard let element = mainElement as? VocabularyModel else { return }
        var array = [Any]()
        for item in element.kanji {
            if !kanaList.contains(item) {
                for searchElement in kanji.setKanji() {
                    if String(item) == searchElement.body {
                        array.append(searchElement)
                    }
                }
            }
        }
        twoDemensionalArray[.main] = [element]
        twoDemensionalArray[.containsKanji] = array
    }
    
    private func kanaListSetup() {
        for item in kana.transformToKana(.hiragana) {
            kanaList += item.kana
        }
    }
    
}
