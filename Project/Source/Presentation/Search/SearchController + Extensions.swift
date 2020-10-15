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
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let element: VocabularyModel
        if !searchArray.isEmpty {
            element = searchArray[indexPath.row]
        } else {
            element = array[indexPath.row]
        }
        pushToDetailViewController(element: element)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func pushToDetailViewController(element: Any) {
        let vc = ViewControllers.detailSearch
        vc.mainElement = element
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        let searchElement: VocabularyModel
        
        if isFiltering {
            searchElement = searchArray[indexPath.row]
        } else {
            searchElement = array[indexPath.row]
        }
        
        if searchElement.kanji == "" {
            cell.setupElements(kanji: searchElement.kana, reading: "", translate: searchElement.translate)
        } else {
            cell.setupElements(kanji: searchElement.kanji, reading: searchElement.kana, translate: searchElement.translate)
        }
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    func filterContentForSearchText(_ searchText: String) {
        let alpabet = "акхблцвмчгншдощепъёрыжсьзтэиуюйфя"
        if alpabet.contains(searchText.prefix(1).lowercased()){
            searchArray = array.filter({ (array: VocabularyModel) -> Bool in
                return array.translate.lowercased().contains(searchText.lowercased())
            })
        } else {
        searchArray = array.filter({ (array: VocabularyModel) -> Bool in
            return array.kanji.lowercased().contains(searchText.lowercased())
        })
        }
        tableView.reloadData()
    }
}
