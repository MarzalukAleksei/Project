//
//  DetailKana.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailKanaViewController: UIViewController {

    var detailKana = ""
    var detailReadingKana = ""
    var previousKana = "test -1"
    var nextKana = "test +1"
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBAction func previousButtom(_ sender: UIButton) {
    }
    @IBAction func nextButtom(_ sender: UIButton) {
    }
    @IBAction func spekerButtom(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        detailLabel.text = detailKana
        readingLabel.text = detailReadingKana

        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
