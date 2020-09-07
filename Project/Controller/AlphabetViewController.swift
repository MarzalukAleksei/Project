//
//  AlphabetViewController.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class AlphabetViewController: UIViewController {

    @IBOutlet weak var hiraganaButtom: UIButton!
    @IBOutlet weak var katakanaButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = designBackGroundColor
        kanaBackgroundLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "hiraganaSegue"{
                guard let destitantion = segue.destination as? KanaCollectionViewController else { return }
                destitantion.typeOfCollection = TypeOfCollectionItem.hiragana
            }else if segue.identifier == "katakanaSegue"{
                guard let destitantion = segue.destination as? KanaCollectionViewController else { return }
                destitantion.typeOfCollection = TypeOfCollectionItem.katakana
            }
        }
    
    func kanaBackgroundLabel(){
        let labelWidth: CGFloat = 30
        let labelHeigth: CGFloat = 30
        
        hiraganaButtom.backgroundColor = designElementColor
        katakanaButtom.backgroundColor = designElementColor
        
        for horizontalItem in 0...horizontalCount(labelWidth: labelWidth){
            for verticalItem in 0...verticalCount(labelheigh: labelHeigth){
                let x = labelWidth * CGFloat(horizontalItem)
                let y = labelHeigth * CGFloat(verticalItem)
                if verticalItem % 2 == 0 {
                    guard let object = randomKana(objectArray: katakana) else {
                        return
                    }
                    let label = createLabel(xCor: x, yCor: y, width: labelWidth, height: labelHeigth, text: object.kana)
                    view.addSubview(label)
                    view.sendSubviewToBack(label)
                }else{
                    guard let object = randomKana(objectArray: hiragana) else {
                        return
                    }
                    let newLabel = createLabel(xCor: x, yCor: y, width: labelWidth, height: labelHeigth, text: object.kana)
                    view.addSubview(newLabel)
                    view.sendSubviewToBack(newLabel)
                }
                    
            }
        }
        
        
        
        
    }
    func verticalCount(labelheigh: CGFloat) -> Int {
        let count = UIScreen.main.bounds.height / labelheigh
        return Int(count)
    }
    
    func horizontalCount(labelWidth: CGFloat) -> Int {
        let count = UIScreen.main.bounds.width / labelWidth
        return Int(count)
    }
    
    func createLabel(xCor: CGFloat,yCor: CGFloat,width: CGFloat,height: CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: xCor, y: yCor, width: width, height: height))
        label.text = text
        label.textAlignment = .center
        
        
        return label
    }
    
    
    
    
    
}
