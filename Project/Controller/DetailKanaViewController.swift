//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController {

    var startElement: Kana?
    var previousElement: Kana?
    var nextElement: Kana?
    let integerForPreviousId = 2 // id начинается с 1
    var typeOfColletion: TypeOfCollectionItem?
//    var arrayOfElements = [Any]()
    var collectionArray: [Kana]?
    enum SideButtom {
        case rightButtom, leftButtom, none
    }
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeCollectionArray()
//        guard let type = typeOfColletion else { return }
//        arrayOfElements = getArray(typeOf: type)
        
        
    }
    
    func changeCollectionArray(){
        switch typeOfColletion {
        case .hiragana:
            collectionArray = hiragana
        case .katakana:
            collectionArray = katakana
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let element = startElement else { return }
        
        detailLabel.text = element.kana
        readingLabel.text = element.reading
        previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
        nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
    }
    
     @IBAction func previousButtom(_ sender: UIButton) {
        changeKana(buttom: SideButtom.leftButtom)
     }
     @IBAction func nextButtom(_ sender: UIButton) {
        changeKana(buttom: SideButtom.rightButtom)
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
    
    func changeKana(buttom: SideButtom){
        guard let collection = collectionArray else { return }
    
        switch buttom {
        case .leftButtom:
            buttomAction(collection: collection, buttom: .leftButtom)
        case .rightButtom:
            buttomAction(collection: collection, buttom: .rightButtom)
        default: break
        }
        detailLabel.text = startElement?.kana
        readingLabel.text = startElement?.reading
        previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
        nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
    }
    func buttomAction(collection: [Kana], buttom: SideButtom) {
    switch buttom {
    case .leftButtom:
        if previousElement?.id != collection.first?.id && previousElement != nil{
            startElement = previousElement
            previousElement = collection[startElement!.id - integerForPreviousId]
            nextElement = collection[startElement!.id]
        }else if previousElement?.id == collection.first?.id{
            startElement = previousElement
            previousElement = nil
            nextElement = collection[startElement!.id]
        }
    case .rightButtom:
        if nextElement?.id != collection.last?.id && nextElement != nil{
                startElement = nextElement
                nextElement = collection[startElement!.id]
                previousElement = collection[startElement!.id - integerForPreviousId]
            }else if nextElement?.id == collection.last?.id{
                startElement = nextElement
                nextElement = nil
                previousElement = collection[startElement!.id - integerForPreviousId]
        }
    default: break
    }
    
    }
    
}



