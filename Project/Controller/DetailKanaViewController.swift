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
    
    enum SideButtom {
        case rightButtom, leftButtom, none
    }
    
    var startElement: Any?
    
    let integerForPreviousId = 2 // id начинается с 1
    
    var typeOfColletion: TypeOfCollectionItem?
    
    var array: [Any]?


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
        switch element {
        case is Kana:
            detail = ""
            reading = ""
            previous = ""
            next = ""
        case is Kanji:
            detail = ""
            reading = ""
            previous = ""
            next = ""
        default: break
        }
        detailLabel.text = detail
        readingLabel.text = reading
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    @IBAction func previousButtom(_ sender: UIButton) {
     //   changeKana(buttom: SideButtom.leftButtom)
    }
    
    @IBAction func nextButtom(_ sender: UIButton) {
      //  changeKana(buttom: SideButtom.rightButtom)
    }
    
    @IBAction func spekerButtom(_ sender: UIButton) {
        
    }
    
//    func changeKana(leftButtomAction: Bool){
//
//           switch leftButtomAction {
//           case true:
//               guard let id = previousElement?.id else { return }
//               if previousElement?.id != hiragana.first?.id && previousElement != nil{
//                   startElement = previousElement
//                   previousElement = hiragana[id - 2]
//                   nextElement = hiragana[id]
//               }else if previousElement?.id == hiragana.first?.id{
//                   startElement = previousElement
//                   previousElement = nil
//                   nextElement = hiragana[id]
//               }
//           default:
//               guard let id = nextElement?.id else { return }
//               if nextElement?.id != hiragana.last?.id && nextElement != nil{
//                   startElement = nextElement
//                   nextElement = hiragana[id]
//                   previousElement = hiragana[id - 2]
//               }else if nextElement?.id == hiragana.last?.id{
//                   startElement = nextElement
//                   nextElement = nil
//                   previousElement = hiragana[id - 2]
//           }
//           }
//           detailLabel.text = startElement?.kana
//           readingLabel.text = startElement?.reading
//           previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
//           nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
//       }
    
//    func changeKana(buttom: SideButtom){
//        guard let collection = array else { return }
//
//        switch buttom {
//        case .leftButtom:
//            buttomAction(collection: collection, buttom: .leftButtom)
//        case .rightButtom:
//            buttomAction(collection: collection, buttom: .rightButtom)
//        default: break
//        }
//        detailLabel.text = startElement?.kana
//        readingLabel.text = startElement?.reading
//        previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
//        nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
//    }
    func buttomAction(collection: [Any], buttom: SideButtom) {
        switch buttom {
        case .leftButtom:
            break
//        if previousElement?.id != ((collection.first) as? Kana)?.id && previousElement != nil{
//            startElement = previousElement
//            guard let id = startElement?.id else { return }
//            previousElement = collection[id - integerForPreviousId] as? Kana
//            nextElement = collection[id] as? Kana
//        }else if previousElement?.id == (collection.first as? Kana)?.id{
//            startElement = previousElement
//            guard let id = startElement?.id else { return }
//            previousElement = nil
//            nextElement = collection[id] as? Kana
//        }
        case .rightButtom:
            break
//        if nextElement?.id != (collection.last as? Kana)?.id && nextElement != nil{
//                startElement = nextElement
//            guard let id = startElement?.id else { return }
//            nextElement = collection[id] as? Kana
//            previousElement = collection[id - integerForPreviousId] as? Kana
//        }else if nextElement?.id == (collection.last as? Kana)?.id {
//                startElement = nextElement
//            guard let id = startElement?.id else { return }
//                nextElement = nil
//                previousElement = collection[id - integerForPreviousId] as? Kana
//        }
        default: break
        }
    }
}



