//
//  SearchViewController.swift
//  Project
//
//  Created by ブラック狼 on 27.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    let vocablary = VocabularySetter()
    var array: [VocabularyModel] = []
    var searchArray = [VocabularyModel]()
    var seachBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !seachBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = vocablary.transformToVocabulary()
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
//        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        tableView.allowsSelection = false
    }
}
