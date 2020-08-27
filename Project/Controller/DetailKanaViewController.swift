//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        cell.kanjiBody.text = elements[indexPath.item]
        cell.kanjiReading.text = searchReadingInVocabularyForKanji(elements[indexPath.item])
        cell.translateTableViewCell.text = searchTranslateInVacabularyForKanji(elements[indexPath.item])
        cell.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9098039216, blue: 0.8705882353, alpha: 1)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "  Примеры"
//    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var hiraganaReading: UILabel!
    @IBOutlet weak var katakanaReading: UILabel!
    @IBOutlet weak var translateLabel: UILabel!

    
    
//    enum SideButtom {
//        case rightButtom, leftButtom, none
//    }
    
    var startElement: Any?
    
    var elements: [String] = []
    
    var typeOfColletion: TypeOfCollectionItem?
    
    var array: [Any]?
    
    var previousElement: Any?
    var nextElement: Any?
    
    let kunLabel = "訓: "
    let onLabel = "音: "
    let imiLabel = "意味: "

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9098039216, blue: 0.8705882353, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
//        tableView.isScrollEnabled = false
        changeCollectionArray()
        elements = getExamplesFromStartElement()
        previousButtonOutlet.layer.cornerRadius = previousButtonOutlet.bounds.size.width * 0.2
        previousButtonOutlet.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9098039216, blue: 0.8705882353, alpha: 1)
        nextButtonOutlet.layer.cornerRadius = nextButtonOutlet.bounds.size.width * 0.2
        nextButtonOutlet.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9098039216, blue: 0.8705882353, alpha: 1)
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
    
    private func getExamplesFromStartElement() -> [String] {
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
    
    private func setupElement(element: Any) {
        var detail = ""
        var reading = ""
        var previous = ""
        var next = ""
        var hiragana = ""
        var katakana = ""
        var translate = ""
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
            reading = currentElement.reading
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
            hiragana = kunLabel + currentElement.readingHiragana
            katakana = onLabel + currentElement.readingKatakana
            translate = imiLabel + currentElement.translate
            startElement = currentArray[currentElement.id - 1]
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        hiraganaReading.text = hiragana
        katakanaReading.text = katakana
        translateLabel.text = translate
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    private func leftButtonAction(element: Any) {
        var detail: String?
        var reading: String?
        var previous: String?
        var next: String?
        var hiragana: String?
        var katakana: String?
        var translate: String?
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
                reading = currentElement.reading
                previous = preElement.kana
            } else if preElement.id == currentArray.first?.id {
                next = currentElement.kana
                currentElement = preElement
                startElement = currentElement
                previousElement = nil
                nextElement = currentArray[currentElement.id]
                detail = currentElement.kana
                reading = currentElement.reading
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
                hiragana = kunLabel + currentElement.readingHiragana
                katakana = onLabel + currentElement.readingKatakana
                translate = imiLabel + currentElement.translate
                previous = preElement.body
            } else if preElement.id == currentArray.first?.id {
                next = currentElement.body
                currentElement = preElement
                startElement = currentElement
                previousElement = nil
                nextElement = currentArray[currentElement.id]
                detail = currentElement.body
                hiragana = kunLabel + currentElement.readingHiragana
                katakana = onLabel + currentElement.readingKatakana
                translate = imiLabel + currentElement.translate
                previous = ""
            }
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        hiraganaReading.text = hiragana
        katakanaReading.text = katakana
        translateLabel.text = translate
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    private func rightButtonAction(element: Any) {
        var detail: String?
        var reading: String?
        var previous: String?
        var next: String?
        var hiragana: String?
        var katakana: String?
        var translate: String?
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
                reading = currentElement.reading
                next = nexElement.kana
            } else if nexElement.id == currentArray.last?.id {
                previous = currentElement.kana
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nextElement = nil
                detail = currentElement.kana
                reading = currentElement.reading
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
                hiragana = kunLabel + currentElement.readingHiragana
                katakana = onLabel + currentElement.readingKatakana
                translate = imiLabel + currentElement.translate
            } else if nexElement.id == currentArray.last?.id {
                previous = currentElement.body
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nextElement = nil
                detail = currentElement.body
                hiragana = kunLabel + currentElement.readingHiragana
                katakana = onLabel + currentElement.readingKatakana
                translate = imiLabel + currentElement.translate
                next = ""
            }
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        hiraganaReading.text = hiragana
        katakanaReading.text = katakana
        translateLabel.text = translate
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        guard let element = startElement else { return }
        leftButtonAction(element: element)
        elements = getExamplesFromStartElement()
        tableView.reloadData()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let element = startElement else { return }
        rightButtonAction(element: element)
        elements = getExamplesFromStartElement()
        tableView.reloadData()
    }
    

    
    
    
}



