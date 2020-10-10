//
//  KanjiModel.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

struct KanjiModel {
    var level: Int
    var body: String
    var readingHiragana: String
    var readingKatakana: String
    var translate: String
    var mistake: Bool = false
    var id: Int = 0
}
