//
//  MainChosenController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit


class MainChosenViewController: UIViewController {
    
    @IBOutlet weak var alphabetButtom: PushElement!
    @IBOutlet weak var kanjiButtom: PushElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDesign()
        setupButtons()
    }
    
    private func setupButtons() {
        let alphabetRecogniser = UITapGestureRecognizer()
        alphabetRecogniser.addTarget(self, action: #selector(alphabetButtonAction))
        alphabetButtom.setupButtons(symbol: "仮名", description: "Алфавит")
        alphabetButtom.addGestureRecognizer(alphabetRecogniser)
        
        
        let kanjiRecogniser = UITapGestureRecognizer()
        kanjiRecogniser.addTarget(self, action: #selector(kanjiButtonAction))

        kanjiButtom.addGestureRecognizer(kanjiRecogniser)
    }
  
    private func loadDesign() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func alphabetButtonAction() {
        navigationController?.pushViewController(ViewControllers.alphabet, animated: true)
    }
    
    @objc private func kanjiButtonAction() {
        navigationController?.pushViewController(ViewControllers.kanji, animated: true)
    }
}


