//
//  MainChosenController.swift
//  Project
//
//  Created by ブラック狼 on 18.05.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit


class MainChosenViewController: BackgroundAnimatedViewController {
    @IBOutlet weak var alphabetButtom: UIButton!
    @IBOutlet weak var kanjiButtom: UIButton!
    
    @IBOutlet weak var customButtom: PushElement!
    
    private let recogniser = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDesign()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disappearView()
    }
    
    private func disappearView() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupButtons() {
        alphabetButtom.backgroundColor = designNewColor
        kanjiButtom.backgroundColor = designNewColor
        customButtom.firstLabel.text = "label1"
        customButtom.secondLabel.text = "label1"
        recogniser.addTarget(self, action: #selector(test))
        customButtom.addGestureRecognizer(recogniser)
    }
  
    private func loadDesign() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func test() {
        print("Yes")
    }
}


