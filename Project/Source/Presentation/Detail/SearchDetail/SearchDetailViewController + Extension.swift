//
//  SearchDetailViewController + Extension.swift
//  Project
//
//  Created by ブラック狼 on 12.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailTableViewCell", for: indexPath) as? SearchDetailTableViewCell else { return UITableViewCell() }
        guard let element = mainElement as? VocabularyModel else { return UITableViewCell() }
        
        cell.setupElement(string: "\(element.kanji) [\(element.kana)] ー \(element.translate)")

        return cell
    }
    
}
