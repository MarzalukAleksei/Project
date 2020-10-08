//
//  DetailViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewParameters()
        changeCollectionArray()
        setTwoDemensionalArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let element = startElement else { return }
        setupElement(element: element)
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
    
    func viewParameters() {
        detailLabel.textColor = UIColor.init(named: "textColor")
        view.backgroundColor = UIColor.init(named: "backgroundColor")
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor.init(named: "buttomColor")
        tableView.separatorColor = UIColor.init(named: "separatorColor")
        previousButtonOutlet.layer.cornerRadius = previousButtonOutlet.bounds.size.width * designElementCornerRadius
        previousButtonOutlet.backgroundColor = UIColor.init(named: "buttomColor")
        previousButtonOutlet.setTitleColor(UIColor.init(named: "textColor"), for: .normal)
        nextButtonOutlet.layer.cornerRadius = nextButtonOutlet.bounds.size.width * designElementCornerRadius
        nextButtonOutlet.backgroundColor = UIColor.init(named: "buttomColor")
        nextButtonOutlet.setTitleColor(UIColor.init(named: "textColor"), for: .normal)
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
        setTwoDemensionalArray()
        tableView.reloadData()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let element = startElement else { return }
        rightButtonAction(element: element)
        setTwoDemensionalArray()
        tableView.reloadData()
    }
}
