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
    var elementsInTableView: [Vocabulary] = []
    var typeOfColletion: TypeOfCollectionItem?
    var twoDemensionalArray: [SectionsInTableView: [String]] = [:]
    var array: [Any]?
    var previousElement: Any?
    var nextElement: Any?
    let kunLabel = "訓: "
    let onLabel = "音: "
    let imiLabel = "意味: "

    enum SectionsInTableView: Int {
        case main = 0, examples
    }
    
    func setupTwoDemensionalArray() {
        var array: [String] = []
        switch startElement {
        case is Kanji:
            guard let element = startElement as? Kanji else { return }
            array.append(element.readingHiragana)
            array.append(element.readingKatakana)
            array.append(element.translate)
            twoDemensionalArray[.main] = array
        case is Kana: break
        default: break
        }
        array.removeAll()
        for item in elementsInTableView {
            array.append(item.kanji)
        }
        twoDemensionalArray[.examples] = array
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let tableviewSection = SectionsInTableView(rawValue: section) {
            switch tableviewSection {
            case .examples:
                return " Примеры"
            case .main:
                return " Чтение и Значение"
            }
        }
        return "Error"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 23
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return twoDemensionalArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: section)!] else { return 0 }
//        return twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: section)!]!.count
        return array.count
    } // как убрать два ! 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        let kanjiName = twoDemensionalArray[DetailKanaViewController.SectionsInTableView(rawValue: indexPath.section)!]?[indexPath.row]
        let kanjiInserts = something(string: kanjiName!)
            cell.kanjiBody.text = kanjiName
    
        cell.kanjiReading.text = kanjiInserts.kana
        cell.translateTableViewCell.text = kanjiInserts.translate
            cell.backgroundColor = designElementColor
            return cell
        
    }

    func something(string: String) -> Vocabulary {
        var element: Vocabulary = Vocabulary(kanji: "", kana: "", translate: "", level: 0)
        for item in elementsInTableView {
            if string == item.kanji {
                element = item
            }
        }
        return element
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewParameters()
        changeCollectionArray()
        elementsForTableView()
    }
    
    func viewParameters() {
        view.backgroundColor = designBackGroundColor
        tableView.allowsSelection = false
        tableView.backgroundColor = designElementColor
        tableView.separatorColor = designSeparatorColor
        previousButtonOutlet.layer.cornerRadius = previousButtonOutlet.bounds.size.width * designElementCornerRadius
        previousButtonOutlet.backgroundColor = designElementColor
        nextButtonOutlet.layer.cornerRadius = nextButtonOutlet.bounds.size.width * designElementCornerRadius
        nextButtonOutlet.backgroundColor = designElementColor
    }
    
    func elementsForTableView() {
        guard let mainElement = startElement as? Kanji else { return }
        elementsInTableView = findElementsInVocabulary(mainElement.body)
        setupTwoDemensionalArray()
    }
    
    func changeCollectionArray() {
        switch typeOfColletion {
        case .hiragana:
            array = hiragana
        case .katakana:
            array = katakana
        case .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            array = newKanjiArray
        case .kanjiAll:
            array = newKanjiArray
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let element = startElement else { return }
        setupElement(element: element)
    }
    
    func getExamplesFromStartElement() -> [String] {
        switch startElement {
        case is Kanji:
            guard let element = startElement as? Kanji else { return [] }
            return element.example
        case is Kana:
            guard let element = startElement as? Kana else { return [] }
            return element.example
        default: return []
        }
    }
    
    func setupElement(element: Any) {
        var detail = ""
        var previous = ""
        var next = ""
        switch element {
        case is Kana:
            guard let currentElement = element as? Kana else { return }
            guard let currentArray = array as? [Kana] else { return }
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
        case is Kanji:
            guard let currentElement = element as? Kanji else { return }
            guard let currentArray = array as? [Kanji] else { return }
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
            startElement = currentArray[currentElement.id - 1]
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
        case is Kana:
            guard var currentElement = element as? Kana else { return }
            guard let currentArray = array as? [Kana] else { return }
            guard var preElement = previousElement as? Kana else { return }
            if preElement.id != currentArray.first?.id && previousElement != nil {
                next = currentElement.kana
                currentElement = preElement
                startElement = currentElement
                preElement = currentArray[currentElement.id - 2]
                previousElement = preElement
                nextElement = currentArray[currentElement.id]
                detail = currentElement.kana
            } else if preElement.id == currentArray.first?.id {
                next = currentElement.kana
                currentElement = preElement
                startElement = currentElement
                previousElement = nil
                nextElement = currentArray[currentElement.id]
                detail = currentElement.kana
                previous = ""
            }
        case is Kanji:
            guard var currentElement = element as? Kanji else { return }
            guard let currentArray = array as? [Kanji] else { return }
            guard var preElement = previousElement as? Kanji else { return }
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
        case is Kana:
            guard var currentElement = element as? Kana else { return }
            guard let currentArray = array as? [Kana] else { return }
            guard var nexElement = nextElement as? Kana else { return }
            if nexElement.id != currentArray.last?.id && nextElement != nil {
                previous = currentElement.kana
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nexElement = currentArray[currentElement.id + 1]
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
        case is Kanji:
            guard var currentElement = element as? Kanji else { return }
            guard let currentArray = array as? [Kanji] else { return }
            guard var nexElement = nextElement as? Kanji else { return }
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
        elementsForTableView()
        tableView.reloadData()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let element = startElement else { return }
        rightButtonAction(element: element)
//        elementsInTableView = getExamplesFromStartElement()
        elementsForTableView()
        tableView.reloadData()
    }
    

    
    
    
}



