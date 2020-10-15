//
//  KanjiViewController + Extension.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/15/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

extension KanjiViewController: BottomViewDelegate {
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
