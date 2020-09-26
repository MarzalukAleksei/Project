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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = vocablary.transformToVocabulary()
        
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.isHidden = false
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.kanjiBody.text = searchArray[indexPath.row].kanji
        cell.kanjiReading.text = searchArray[indexPath.row].kana
        cell.kanjiTranslate.text = searchArray[indexPath.row].translate

        return cell
    }
    

    

}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    func filterContentForSearchText(_ searchText: String) {
        searchArray = array.filter({ (array: VocabularyModel) -> Bool in
            return array.kanji.lowercased().contains(searchText.lowercased())
        })
    }
}
