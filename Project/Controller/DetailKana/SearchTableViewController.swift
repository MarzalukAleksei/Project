//
//  SearchTableViewController.swift
//  Project
//
//  Created by ブラック狼 on 25.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    let vocablary = VocabularySetter()
    var searchArray: [VocabularyModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchArray = vocablary.transformToVocabulary()
        
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
