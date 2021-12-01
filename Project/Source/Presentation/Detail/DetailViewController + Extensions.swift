//
//  DetailViewController + Extensions.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/25/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 25))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.bounds.width, height: headerView.bounds.height))
        guard let tableviewSection = SectionsInTableView(rawValue: section) else { return UIView() }
        switch tableviewSection {
            case .examples:
                label.text = "Примеры"
            case .main:
                label.text = "Чтение и Значение"
        }
        headerView.addSubview(label)
        headerView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 23
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDemensionalArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let indexOfSection = DetailViewController.SectionsInTableView(rawValue: section), let count = twoDemensionalArray[indexOfSection]?.count else {
            return 0
        }
        return count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        switch startElement {
        case is KanjiModel:
            if let tableSection = SectionsInTableView(rawValue: indexPath.section) {
                switch tableSection {
                case .examples:
                    guard let row = twoDemensionalArray[DetailViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? VocabularyModel else { return UITableViewCell() }
                    
                    cell.setupElements(kanji: row.kanji, reading: row.kana, translate: row.translate)
                case .main:
                    guard let row = twoDemensionalArray[DetailViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? String else { return UITableViewCell() }
                    
                    cell.setupElements(kanji: row, reading: "", translate: "")
                }
            }
        case is KanaModel:
        if let tableSection = SectionsInTableView(rawValue: indexPath.section) {
            switch tableSection {
            case .examples:
            guard let row = twoDemensionalArray[DetailViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? VocabularyModel else { return UITableViewCell() }
                
                cell.setupElements(kanji: row.kanji, reading: row.kana, translate: row.translate)
            case .main:
            guard let row = twoDemensionalArray[DetailViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? String else { return UITableViewCell() }
                
                cell.setupElements(kanji: row, reading: "", translate: "")
            }
            }
            
        default: break
        }
        return cell
    }
}

extension DetailViewController: BottomViewDelegate {
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
