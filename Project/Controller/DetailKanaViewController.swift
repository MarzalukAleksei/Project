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
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
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
        changeKana(tappedLeftButtom: true)
     }
     @IBAction func nextButtom(_ sender: UIButton) {
        changeKana(tappedLeftButtom: false)
     }
     @IBAction func spekerButtom(_ sender: UIButton) {
     }
    
    func changeKana(tappedLeftButtom: Bool){
        
        switch tappedLeftButtom {
        case true:
            if previousElement?.id != hiragana.first?.id && previousElement != nil{
                startElement = previousElement
                previousElement = hiragana[startElement!.id - 2]
                nextElement = hiragana[startElement!.id]
            }else if previousElement?.id == hiragana.first?.id{
                startElement = previousElement
                previousElement = nil
                nextElement = hiragana[startElement!.id]
            }
        default:
            if nextElement?.id != hiragana.last?.id && nextElement != nil{
                startElement = nextElement
                nextElement = hiragana[startElement!.id]
                previousElement = hiragana[startElement!.id - 2]
            }else if nextElement?.id == hiragana.last?.id{
                startElement = nextElement
                nextElement = nil
                previousElement = hiragana[startElement!.id - 2]
        }
        
        
        }
        detailLabel.text = startElement?.kana
        readingLabel.text = startElement?.reading
        previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
        nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
    }
    
    
}


