//
//  KanjiBottomViewController.swift
//  Project
//
//  Created by ブラック狼 on 24.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanjiBottomViewController: UIViewController {

    @IBOutlet weak var allKanjiButtom: UIButton!
    @IBOutlet weak var n1KanjiButtom: UIButton!
    @IBOutlet weak var n2KanjiButtom: UIButton!
    @IBOutlet weak var n3KanjiButtom: UIButton!
    @IBOutlet weak var n4KanjiButtom: UIButton!
    @IBOutlet weak var n5KanjiButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = designBackGroundColor
        background()
    }
    
    private func background() {
        let labelWidth: CGFloat = 35
        let labelHeigh: CGFloat = 35
        let bounds = view.bounds.height
        
        n5KanjiButtom.backgroundColor = designElementColor
        n4KanjiButtom.backgroundColor = designElementColor
        n3KanjiButtom.backgroundColor = designElementColor
        n2KanjiButtom.backgroundColor = designElementColor
        n1KanjiButtom.backgroundColor = designElementColor
        allKanjiButtom.backgroundColor = designElementColor
        
        for horizontal in 0...backgroundHorizontalElementsCount(elementHeight: labelWidth) {
            for vertical in 0...backgroungVerticalElementsCount(elementWidth: labelHeigh) {
                let x = labelWidth * CGFloat(horizontal)
                let y = labelHeigh * CGFloat(vertical)
                let label = UILabel(frame: CGRect(x: x, y: y, width: labelWidth, height: labelHeigh))
                label.text = kanji.randomElement()?.body
                label.textAlignment = .center
                if bounds >= y + labelHeigh {
                    view.addSubview(label)
                    view.sendSubviewToBack(label)
                }
            }
        }
    }
    
    func backgroundHorizontalElementsCount(elementHeight: CGFloat) -> Int{
        let count = view.bounds.width / elementHeight
        return Int(count)
    }
    
    func backgroungVerticalElementsCount(elementWidth: CGFloat) -> Int {
        let count = view.bounds.height / elementWidth
        return Int(count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "n1Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN1
        case "n2Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN2
        case "n3Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN3
        case "n4Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN4
        case "n5Segue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiN5
        case "AllSegue":
            guard let destinasion = segue.destination as? KanaCollectionViewController else { return }
            destinasion.typeOfCollection = TypeOfCollectionItem.kanjiAll
        default: break
        }
    }
}
