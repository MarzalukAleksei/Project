//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!

    var startElement: Any?
    var typeOfColletion: TypeOfCollectionItem?
    var twoDemensionalArray: [SectionsInTableView: [Any]] = [:]
    var array: [Any]?
    var previousElement: Any?
    var nextElement: Any?
    let kunLabel = "訓: "
    let onLabel = "音: "
    let imiLabel = "意味: "

    enum SectionsInTableView: Int {
        case main = 0, examples = 1
    }
    
    func setTwoDemensionalArray() {
        let vocabulary = VocabularySetter()
        switch startElement {
        case is KanjiModel:
            guard let element = startElement as? KanjiModel else { return }
            let examplesSection = vocabulary.findElementsInVocabulary(element.body, typeOf: .kanji)
            var array = [Any]()
            array.append(kunLabel + element.readingHiragana)
            array.append(onLabel + element.readingKatakana)
            array.append(imiLabel + element.translate)
            twoDemensionalArray[.main] = array
            twoDemensionalArray[.examples] = examplesSection
        case is KanaModel:
            guard let element = startElement as? KanaModel else { return }
            var array = [Any]()
            array.append(element.reading)
            twoDemensionalArray[.main] = array
            twoDemensionalArray[.examples] = vocabulary.findElementsInVocabulary(element.kana, typeOf: .kana)
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerVIew = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 25))
        let label = UILabel(frame: CGRect(x: 10, y: 1.5, width: tableView.bounds.width, height: headerVIew.bounds.height - 5))
        guard let tableviewSection = SectionsInTableView(rawValue: section) else { return UIView() }
//        if let tableviewSection = SectionsInTableView(rawValue: section) {
            switch tableviewSection {
            case .examples:
                label.text = "Примеры"
            case .main:
                label.text = "Чтение и Значение"
            }
//        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewParameters()
        changeCollectionArray()
        setTwoDemensionalArray()
    }
    
    func viewParameters() {
        view.backgroundColor = designBackgroundColor
        tableView.allowsSelection = false
        tableView.backgroundColor = designElementColor
        tableView.separatorColor = designSeparatorColor
        previousButtonOutlet.layer.cornerRadius = previousButtonOutlet.bounds.size.width * designElementCornerRadius
        previousButtonOutlet.backgroundColor = designElementColor
        nextButtonOutlet.layer.cornerRadius = nextButtonOutlet.bounds.size.width * designElementCornerRadius
        nextButtonOutlet.backgroundColor = designElementColor
    }
    
    func changeCollectionArray() {
        let kana = KanaSetter()
        let difficult = DifficultLevel()
        switch typeOfColletion {
        case .hiragana:
            array = kana.transformToKana(.hiragana)
        case .katakana:
            array = kana.transformToKana(.katakana)
        case .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            guard let element = startElement as? KanjiModel else { return }
            array = difficult.selectLevelFromArray(difficultLevel: element.level)
        case .kanjiAll:
            array = difficult.selectLevelFromArray(difficultLevel: 0)
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let element = startElement else { return }
        setupElement(element: element)
    }
    
    func setupElement(element: Any) {
        var detail = ""
        var previous = ""
        var next = ""
        switch element {
        case is KanaModel:
            guard let currentElement = element as? KanaModel else { return }
            guard let currentArray = array as? [KanaModel] else { return }
            if currentElement.id != currentArray.first?.id && currentElement.id != currentArray.last?.id {
                previous = currentArray[currentElement.id - 2].kana
                previousElement = currentArray[currentElement.id - 2]
                next = currentArray[currentElement.id].kana
                nextElement = currentArray[currentElement.id]
            } else if currentElement.id == currentArray.first?.id{
                next = currentArray[currentElement.id].kana
                nextElement = currentArray[currentElement.id]
            } else if currentElement.id == currentArray.last?.id{
                previous = currentArray[currentElement.id - 2].kana
                previousElement = currentArray[currentElement.id - 2]
            }
            detail = currentElement.kana
            startElement = currentArray[currentElement.id - 1]
        case is KanjiModel:
            guard let currentElement = element as? KanjiModel else { return }
            guard let currentArray = array as? [KanjiModel] else { return }
            if currentElement.id != currentArray.first?.id && currentElement.id != currentArray.last?.id {
                previous = currentArray[currentElement.id - 2].body
                previousElement = currentArray[currentElement.id - 2]
                next = currentArray[currentElement.id].body
                nextElement = currentArray[currentElement.id]
            } else if currentElement.id == currentArray.first?.id && currentElement.id == currentArray.last?.id {
                nextElement = nil
                previousElement = nil
            } else if currentElement.id == currentArray.last?.id{
                previous = currentArray[currentElement.id - 2].body
                previousElement = currentArray[currentElement.id - 2]
            } else if currentElement.id == currentArray.first?.id {
                next = currentArray[currentElement.id].body
                nextElement = currentArray[currentElement.id]
            }
            detail = currentElement.body
            print(currentElement.id)
        default: break
        }
        detailLabel.text = detail
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    func leftButtonAction(element: Any) {
        var detail: String?
        var previous: String?
        var next: String?
        switch element {
        case is KanaModel:
            guard var currentElement = element as? KanaModel else { return }
            guard let currentArray = array as? [KanaModel] else { return }
            guard var preElement = previousElement as? KanaModel else { return }
            if preElement.id != currentArray.first?.id && previousElement != nil {
                next = currentElement.kana
                currentElement = preElement
                startElement = currentElement
                preElement = currentArray[currentElement.id - 2]
                previousElement = preElement
                nextElement = currentArray[currentElement.id]
                detail = currentElement.kana
                previous = preElement.kana
            } else if preElement.id == currentArray.first?.id {
                next = currentElement.kana
                currentElement = preElement
                startElement = currentElement
                previousElement = nil
                nextElement = currentArray[currentElement.id]
                detail = currentElement.kana
                previous = ""
            }
        case is KanjiModel:
            guard var currentElement = element as? KanjiModel else { return }
            guard let currentArray = array as? [KanjiModel] else { return }
            guard var preElement = previousElement as? KanjiModel else { return }
            if preElement.id != currentArray.first?.id && previousElement != nil {
                next = currentElement.body
                currentElement = preElement
                startElement = currentElement
                preElement = currentArray[currentElement.id - 2]
                previousElement = preElement
                nextElement = currentArray[currentElement.id]
                detail = currentElement.body
                previous = preElement.body
            } else if preElement.id == currentArray.first?.id {
                next = currentElement.body
                currentElement = preElement
                startElement = currentElement
                previousElement = nil
                nextElement = currentArray[currentElement.id]
                detail = currentElement.body
                previous = ""
            }
        default: break
        }
        detailLabel.text = detail
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    func rightButtonAction(element: Any) {
        var detail: String?
        var previous: String?
        var next: String?
        switch element {
        case is KanaModel:
            guard var currentElement = element as? KanaModel else { return }
            guard let currentArray = array as? [KanaModel] else { return }
            guard var nexElement = nextElement as? KanaModel else { return }
            if nexElement.id != currentArray.last?.id && nextElement != nil {
                previous = currentElement.kana
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nexElement = currentArray[currentElement.id]
                nextElement = nexElement
                detail = currentElement.kana
                next = nexElement.kana
            } else if nexElement.id == currentArray.last?.id {
                previous = currentElement.kana
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nextElement = nil
                detail = currentElement.kana
                next = ""
            }
        case is KanjiModel:
            guard var currentElement = element as? KanjiModel else { return }
            guard let currentArray = array as? [KanjiModel] else { return }
            guard var nexElement = nextElement as? KanjiModel else { return }
            if nexElement.id != currentArray.last?.id && nextElement != nil {
                previous = currentElement.body
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nexElement = currentArray[currentElement.id]
                nextElement = nexElement
                next = nexElement.body
                detail = currentElement.body
            } else if nexElement.id == currentArray.last?.id {
                previous = currentElement.body
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nextElement = nil
                detail = currentElement.body
                next = ""
            }
        default: break
        }
        detailLabel.text = detail
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        guard let element = startElement else { return }
        leftButtonAction(element: element)
//        elementsInTableView = getExamplesFromStartElement()
        setTwoDemensionalArray()
        tableView.reloadData()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let element = startElement else { return }
        rightButtonAction(element: element)
//        elementsInTableView = getExamplesFromStartElement()
        setTwoDemensionalArray()
        tableView.reloadData()
    }
    
}



