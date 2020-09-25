//
//  DetailKanaViewController + Extensions.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/25/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

extension DetailKanaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerVIew = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 25))
        let label = UILabel(frame: CGRect(x: 10, y: 1.5, width: tableView.bounds.width, height: headerVIew.bounds.height - 5))
        guard let tableviewSection = SectionsInTableView(rawValue: section) else { return UIView() }
        switch tableviewSection {
            case .examples:
                label.text = "Примеры"
            case .main:
                label.text = "Чтение и Значение"
        }
        headerVIew.backgroundColor = designHeaderInSectionColor
        headerVIew.addSubview(label)
        return headerVIew
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 23
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDemensionalArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let indexOfSection = DetailKanaViewController.SectionsInTableView(rawValue: section), let count = twoDemensionalArray[indexOfSection]?.count else {
            return 0
        }
        return count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        switch startElement {
        case is KanjiModel:
            if let tableSection = SectionsInTableView(rawValue: indexPath.section) {
                switch tableSection {
                case .examples:
                    guard let row = twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? VocabularyModel else { return UITableViewCell() }
                    cell.kanjiBody.text = row.kanji
                    cell.kanjiReading.text = row.kana
                    cell.translateTableViewCell.text = row.translate
                case .main:
                    guard let row = twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? String else { return UITableViewCell() }
                    cell.kanjiBody.text = row
                    cell.kanjiReading.text = ""
                    cell.translateTableViewCell.text = ""
                }
            }
        case is KanaModel:
        if let tableSection = SectionsInTableView(rawValue: indexPath.section) {
            switch tableSection {
            case .examples:
            guard let row = twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? VocabularyModel else { return UITableViewCell() }
            cell.kanjiBody.text = row.kana
            cell.translateTableViewCell.text = row.translate
            cell.kanjiReading.text = ""
            case .main:
            guard let row = twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row] as? String else { return UITableViewCell() }
            cell.kanjiBody.text = row
            cell.kanjiReading.text = ""
            cell.translateTableViewCell.text = ""
            }
            }
        default: break
        }
            cell.backgroundColor = designElementColor
            return cell
    }
}
