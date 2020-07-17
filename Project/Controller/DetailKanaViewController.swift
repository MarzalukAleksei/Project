//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController {

    var startElement: Kana? = nil
    var previousElement: Kana? = nil
    var nextElement: Kana? = nil
    let integerForPreviousId = 2 // id начинается с 1
    var typeOfColletion: TypeOfCollectionItem?
    var collectionArray: [Kana]?
    enum SideButtom {
        case rightButtom
        case leftButtom
        case none
    }
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeCollectionArray()
        
        
        
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
    
    func changeKana(buttom: SideButtom){
        
        switch buttom {
        case .leftButtom:
            leftButtomAction(collectiont: collectionArray!)
        case .rightButtom:
            rightButtomAction(collectiont: collectionArray!)
        default: break
        }
        detailLabel.text = startElement?.kana
        readingLabel.text = startElement?.reading
        previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
        nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
    }
    func leftButtomAction(collectiont: [Kana]) {
        if previousElement?.id != collectiont.first?.id && previousElement != nil{
            startElement = previousElement
            previousElement = collectiont[startElement!.id - integerForPreviousId]
            nextElement = collectiont[startElement!.id]
        }else if previousElement?.id == collectiont.first?.id{
            startElement = previousElement
            previousElement = nil
            nextElement = collectiont[startElement!.id]
        }
    }
    func rightButtomAction(collectiont: [Kana]) {
        if nextElement?.id != collectiont.last?.id && nextElement != nil{
                startElement = nextElement
                nextElement = collectiont[startElement!.id]
                previousElement = collectiont[startElement!.id - integerForPreviousId]
            }else if nextElement?.id == collectiont.last?.id{
                startElement = nextElement
                nextElement = nil
                previousElement = collectiont[startElement!.id - integerForPreviousId]
        }
    }
}


