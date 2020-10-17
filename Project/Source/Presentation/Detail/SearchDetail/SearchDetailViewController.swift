//
//  SearchDetailViewController.swift
//  Project
//
//  Created by ブラック狼 on 12.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var bottomView: BottomView!
    
    private let searchCellID = "SearchDetailTableViewCell"
    var mainElement: Any?
    var twoDemensionalArray: [Section: [Any]] = [:]
    var kanaList = ""
    
    private let interactor: ISearchInteractor = SearchInteractor(kanaRepository: KanaRepository(store: Stores.shared.kanaStore, mapper: KanaMapper(csvMapper: CSVMapper())), kanjiRepository: KanjiRepository(kanjiMapper: KanjiMapper(csvMapper: CSVMapper()) , kanjiStore: Stores.shared.kanjiStore))
    
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
        tableView.register(UINib(nibName: searchCellID, bundle: nil), forCellReuseIdentifier: searchCellID)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func searchElementsForArray() {
        guard let element = mainElement as? VocabularyModel else { return }
        var array = [Any]()
        let kanjiArray = interactor.getKanji()
        for item in element.kanji {
            if !kanaList.contains(item) {
                for searchElement in kanjiArray {
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
        for item in interactor.getKana() {
            kanaList += item.katakana
        }
    }
}
