//
//  SearchController + Extensions.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/26/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
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
