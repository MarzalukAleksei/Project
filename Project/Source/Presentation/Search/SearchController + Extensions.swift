//
//  SearchController + Extensions.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/26/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return searchArray.count
        }
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    func filterContentForSearchText(_ searchText: String) {
        searchArray = array.filter({ (array: VocabularyModel) -> Bool in
            return array.kanji.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
