//
//  SearchDetailViewController + Extension.swift
//  Project
//
//  Created by ブラック狼 on 12.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.rowHeight / 2, height: tableView.bounds.width))
//        let label = UILabel(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
//
//        headerView.addSubview(label)
//        return headerView
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = SearchDetailViewController.Section(rawValue: section) else { return "" }
        switch section {
        case .main:
            return "Main"
        case .containsKanji:
            return "Kanji"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDemensionalArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let indexOfSection = SearchDetailViewController.Section(rawValue: section), let count = twoDemensionalArray[indexOfSection]?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailTableViewCell", for: indexPath) as? SearchDetailTableViewCell else { return UITableViewCell() }
        guard let section = Section(rawValue: indexPath.section) else { return UITableViewCell() }
        let mainElement = twoDemensionalArray[section]?[indexPath.row]
        switch section {
        case .main:
            guard let element = mainElement as? VocabularyModel else { return UITableViewCell() }
            cell.setupElement(string: "\(element.kanji) [\(element.kana)] - \(element.translate)")
        case .containsKanji:
            guard let element = mainElement as? KanjiModel else { return UITableViewCell() }
            cell.setupElement(string: "\(element.body) [\(element.readingHiragana)][\(element.readingKatakana)] - \(element.translate)\nУровень кандзи: \(element.level)")
            
        }
        
        return cell
    }
    
}
