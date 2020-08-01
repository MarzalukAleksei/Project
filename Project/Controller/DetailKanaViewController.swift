//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var hiraganaReading: UILabel!
    @IBOutlet weak var katakanaReading: UILabel!
    
    enum SideButtom {
        case rightButtom, leftButtom, none
    }
    
    var startElement: Any?
    
    
    var typeOfColletion: TypeOfCollectionItem?
    
    var array: [Any]?
    
    var previousElement: Any?
    var nextElement: Any?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        changeCollectionArray()
    }
    
    func changeCollectionArray() {
        switch typeOfColletion {
        case .hiragana:
            array = hiragana
        case .katakana:
            array = katakana
        case .kanjiN1:
            array = newKanjiArray
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let element = startElement else { return }
        setupElement(element: element)
    }
    
    
    
    private func setupElement(element: Any) {
        var detail = ""
        var reading = ""
        var previous = ""
        var next = ""
        var hiragana = ""
        var katakana = ""
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
            if currentElement.number != currentArray.first?.number && currentElement.number != currentArray.last?.number {
                previous = currentArray[currentElement.number - 2].body
                previousElement = currentArray[currentElement.number - 2]
                next = currentArray[currentElement.number].body
                nextElement = currentArray[currentElement.number]
            } else if currentElement.number == currentArray.first?.number{
                next = currentArray[currentElement.number].body
                nextElement = currentArray[currentElement.number]
            } else if currentElement.number == currentArray.last?.number{
                previous = currentArray[currentElement.number - 2].body
                previousElement = currentArray[currentElement.number - 2]
            }
            detail = currentElement.body
            hiragana = currentElement.readingHiragana
            katakana = currentElement.readingKatakana
            startElement = currentArray[currentElement.number - 1]
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        hiraganaReading.text = hiragana
        katakanaReading.text = katakana
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    private func leftButtomAction(element: Any) {
        var detail: String?
        var reading: String?
        var previous: String?
        var next: String?
        var hiragana: String?
        var katakana: String?
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
            if preElement.number != currentArray.first?.number && previousElement != nil {
                next = currentElement.body
                currentElement = preElement
                startElement = currentElement
                preElement = currentArray[currentElement.number - 2]
                previousElement = preElement
                nextElement = currentArray[currentElement.number]
                detail = currentElement.body
                hiragana = currentElement.readingHiragana
                katakana = currentElement.readingKatakana
                previous = preElement.body
            } else if preElement.number == currentArray.first?.number {
                next = currentElement.body
                currentElement = preElement
                startElement = currentElement
                previousElement = nil
                nextElement = currentArray[currentElement.number]
                detail = currentElement.body
                hiragana = currentElement.readingHiragana
                katakana = currentElement.readingKatakana
                previous = ""
            }
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        hiraganaReading.text = hiragana
        katakanaReading.text = katakana
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    private func rightButtomAction(element: Any) {
        var detail: String?
        var reading: String?
        var previous: String?
        var next: String?
        var hiragana: String?
        var katakana: String?
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
                nexElement = currentArray[currentElement.id]
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
            if nexElement.number != currentArray.last?.number && nextElement != nil {
                previous = currentElement.body
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nexElement = currentArray[currentElement.number]
                nextElement = nexElement
                detail = currentElement.body
                hiragana = currentElement.readingHiragana
                katakana = currentElement.readingKatakana
            } else if nexElement.number == currentArray.last?.number {
                previous = currentElement.body
                previousElement = currentElement
                currentElement = nexElement
                startElement = currentElement
                nextElement = nil
                detail = currentElement.body
                hiragana = currentElement.readingHiragana
                katakana = currentElement.readingKatakana
                next = ""
            }
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        hiraganaReading.text = hiragana
        katakanaReading.text = katakana
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    @IBAction func previousButtom(_ sender: UIButton) {
        guard let element = startElement else { return }
        leftButtomAction(element: element)
     //   changeKana(buttom: SideButtom.leftButtom)
    }
    
    @IBAction func nextButtom(_ sender: UIButton) {
        guard let element = startElement else { return }
        rightButtomAction(element: element)
      //  changeKana(buttom: SideButtom.rightButtom)
    }
    
    @IBAction func spekerButtom(_ sender: UIButton) {
        
    }
    
    
    
}



