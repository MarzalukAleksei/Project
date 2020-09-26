//
//  BackgroundAnimatedViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class BackgroundAnimatedViewController: UIViewController {
    
    private let backgroundAnimateDurationFrom: CGFloat = 10
    private let backgroundAnimateDurationTo: CGFloat = 30
    private let widthOfLabel: CGFloat = 30
    private let heightOfLabel: CGFloat = 30
    private let firstCordinate: CGFloat = 0
    private var labels = [UILabel]()
    private var onDisplay = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onDisplay = true
        setupStartPlaceOfLabelsAndAnimateIt()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.layer.removeAllAnimations()
        onDisplay = false
    }
    
    private func setupStartPlaceOfLabelsAndAnimateIt() {
        labels.forEach { (label) in
            label.frame.origin.x = randomFloat(from: firstCordinate, to: UIScreen.main.bounds.width)
            animateLabel(label: label, duration: Double(randomFloat(from: backgroundAnimateDurationFrom, to: backgroundAnimateDurationTo)))
        }
    }
    
    private func createLabels() {
        let countOfLabels = getCountOfLabels(heightOfLabel: heightOfLabel)
        let kanji = KanjiSetter()
        let arrayItem = kanji.setKanji()
        for value in 0...countOfLabels {
            guard let randomText = arrayItem.randomElement()?.body else { return }
            let alpha = randomFloat(from: 0.40, to: 0.85)
            let widthSize = randomFloat(from: 15, to: 49)
            let y = heightOfLabel * CGFloat(value)
            let newLabel = UILabel(labelText: randomText, labelWidth: widthOfLabel, labelHeight: heightOfLabel, yCordinate: y, xCordinate: 0, widthSize: widthSize, alpha: alpha)
            labels.append(newLabel)
            view.addSubview(newLabel)
            view.sendSubviewToBack(newLabel)
        }
    }
    
    private func animateLabel(label: UILabel, duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            label.frame.origin.x = self.view.frame.width
        }) { [weak self] (_) in
            guard let weakSelf = self else { return }
            if weakSelf.onDisplay {
                label.frame.origin.x = weakSelf.firstCordinate
                weakSelf.animateLabel(label: label, duration: duration)
            }
        }
    }
    
    private func getCountOfLabels(heightOfLabel: CGFloat) -> Int {
        return Int( UIScreen.main.bounds.height / heightOfLabel)
    }
}