//
//  SearchTableViewController.swift
//  Project
//
//  Created by ブラック狼 on 25.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
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
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        tableView.allowsSelection = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return searchArray.count
        }
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        let searchElement: VocabularyModel
        
        if isFiltering {
            searchElement = searchArray[indexPath.row]
        } else {
            searchElement = array[indexPath.row]
        }
        
        cell.kanjiBody.text = searchElement.kanji
        cell.kanjiReading.text = searchElement.kana
        cell.kanjiTranslate.text = searchElement.translate

        return cell
    }
}

