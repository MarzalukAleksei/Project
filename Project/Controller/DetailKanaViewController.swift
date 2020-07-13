//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController {

    var startElement :Kana? = nil
    var detailKana = ""
    var detailReadingKana = ""
    var previousKana = "test -1"
    var nextKana = "test +1"
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var previousButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = startElement?.kana
        readingLabel.text = startElement?.reading
//        previousButtonOutlet.setTitle(previousKana, for: .normal) // показывает предудущую кану
//        nextButtonOutlet.setTitle(nextKana, for: .normal) // следующую кану
        
        
        
        
    }
    

     @IBAction func previousButtom(_ sender: UIButton) {
     }
     @IBAction func nextButtom(_ sender: UIButton) {
     }
     @IBAction func spekerButtom(_ sender: UIButton) {
     }
}
