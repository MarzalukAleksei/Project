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
        changeKana()
     }
     @IBAction func nextButtom(_ sender: UIButton) {
     }
     @IBAction func spekerButtom(_ sender: UIButton) {
     }
    
    func changeKana(){
        startElement = previousElement
        previousElement = hiragana[startElement!.id - 2]
        nextElement = hiragana[startElement!.id]
        detailLabel.text = startElement?.kana
        readingLabel.text = startElement?.reading
        previousButtonOutlet.setTitle(previousElement?.kana, for: .normal)
        nextButtonOutlet.setTitle(nextElement?.kana, for: .normal)
    }
    
    
}


