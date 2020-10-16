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
    
    var mainElement: Any?
    var array: [Section: [Any?]] = [:]
//    let kanji = KanjiSetter()
//    let kana = KanaSetter()
    var kanaList = ""
    
    
    enum Section: Int {
        case main = 0
        case kanji = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbleViewParameters()
        searchElementsForArray()
        
    }
    
    private func tabbleViewParameters() {
        tableView.register(UINib(nibName: "SearchDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchDetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func searchElementsForArray() {
        guard let element = mainElement as? VocabularyModel else { return }
        
        array[.main]?.append(element)
        for _ in element.kanji {
            
        }
        
        
    }
    
    private func kanaListSetup() {
//        for item in kana.transformToKana(<#T##typeOf: TypeOfCollectionItem##TypeOfCollectionItem#>) {
//            
//        }
    }
    
}
