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
        case .kanji:
            array = kanji
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
                next = currentArray[currentElement.id].kana
            } else if currentElement.id == currentArray.first?.id{
                next = currentArray[currentElement.id].kana
            } else if currentElement.id == currentArray.last?.id{
                previous = currentArray[currentElement.id - 2].kana
            }
            detail = currentElement.kana
            reading = currentElement.reading
            startElement = currentArray[currentElement.id - 1]
        case is Kanji:
            guard let currentElement = element as? Kanji else { return }
            guard let currentArray = array as? [Kanji] else { return }
            if currentElement.number != currentArray.first?.number && currentElement.number != currentArray.last?.number {
                previous = currentArray[currentElement.number - 2].body
                next = currentArray[currentElement.number].body
            } else if currentElement.number == currentArray.first?.number{
                next = currentArray[currentElement.number].body
            } else if currentElement.number == currentArray.last?.number{
                previous = currentArray[currentElement.number - 2].body
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
            guard let currentElement = element as? Kana else { return }
            guard let currentArray = array as? [Kana] else { return }
            if currentElement.id != currentArray.first?.id && currentElement.id >= 3 {
                next = currentElement.kana
                detail = currentArray[currentElement.id - 2].kana
                reading = currentArray[currentElement.id - 2].reading
                previous = currentArray[currentElement.id - 3].kana
                startElement = currentArray[currentElement.id - 2]
            } else if currentElement.id == 2 {
                next = currentElement.kana
                detail = currentArray[currentElement.id - 2].kana
                reading = currentArray[currentElement.id - 2].reading
                previous = nil
                startElement = currentArray[currentElement.id - 2]
            } else if currentElement.id == 1 {
                next = currentElement.kana
                detail = currentArray[currentElement.id - 1].kana
                reading = currentArray[currentElement.id - 1].reading
                previous = nil
            }
            
        case is Kanji:
            guard let currentElement = element as? Kanji else { return }
            guard let currentArray = array as? [Kanji] else { return }
            if currentElement.number != currentArray.first?.number && currentElement.number >= 3 {
                next = currentElement.body
                detail = currentArray[currentElement.number - 2].body
                hiragana = currentArray[currentElement.number - 2].readingHiragana
                katakana = currentArray[currentElement.number - 2].readingKatakana
                previous = currentArray[currentElement.number - 3].body
                startElement = currentArray[currentElement.number - 2]
            } else if currentElement.number == 2 {
                next = currentElement.body
                detail = currentArray[currentElement.number - 2].body
                hiragana = currentArray[currentElement.number - 2].readingHiragana
                katakana = currentArray[currentElement.number - 2].readingKatakana
                previous = nil
                startElement = currentArray[currentElement.number - 2]
            } else if currentElement.number == 1 {
                next = currentElement.body
                detail = currentArray[currentElement.number - 1].body
                hiragana = currentArray[currentElement.number - 1].readingHiragana
                katakana = currentArray[currentElement.number - 1].readingKatakana
                previous = nil
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
            guard let currentElement = element as? Kana else { return }
            guard let currentArray = array as? [Kana] else { return }
            if currentElement.id != currentArray.last?.id {
                next = currentArray[currentElement.id + 1].kana
                detail = currentArray[currentElement.id].kana
                reading = currentArray[currentElement.id].reading
                previous = currentArray[currentElement.id - 1].kana
                startElement = currentArray[currentElement.id]
            } else if currentElement.id - 2) {
                next = currentElement.kana
                detail = currentArray[currentElement.id - 2].kana
                reading = currentArray[currentElement.id - 2].reading
                previous = nil
                startElement = currentArray[currentElement.id - 2]
            } else if currentElement.id == 1 {
                next = currentElement.kana
                detail = currentArray[currentElement.id - 1].kana
                reading = currentArray[currentElement.id - 1].reading
                previous = nil
            }
            
        case is Kanji:
            guard let currentElement = element as? Kanji else { return }
            guard let currentArray = array as? [Kanji] else { return }
            if currentElement.number != currentArray.first?.number && currentElement.number >= 3 {
                next = currentArray[currentElement.number + 1].body
                detail = currentArray[currentElement.number].body
                hiragana = currentArray[currentElement.number].readingHiragana
                katakana = currentArray[currentElement.number].readingKatakana
                previous = currentArray[currentElement.number - 1].body
                startElement = currentArray[currentElement.number]
            } else if currentElement.number == 2 {
                next = currentElement.body
                detail = currentArray[currentElement.number - 2].body
                hiragana = currentArray[currentElement.number - 2].readingHiragana
                katakana = currentArray[currentElement.number - 2].readingKatakana
                previous = nil
                startElement = currentArray[currentElement.number - 2]
            } else if currentElement.number == 1 {
                next = currentElement.body
                detail = currentArray[currentElement.number - 1].body
                hiragana = currentArray[currentElement.number - 1].readingHiragana
                katakana = currentArray[currentElement.number - 1].readingKatakana
                previous = nil
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



