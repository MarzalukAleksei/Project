//
//  KanaModel.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

struct KanaModel {
    var hiragana: String
    var katakana: String
    var reading: String
    var id: Int = 0
    var example: [String] = []
    var mistake: Bool = false
    
    init(hiragana: String, katakana: String, reading: String, id: Int , example: [String], mistake: Bool = false) {
        self.hiragana = hiragana
        self.katakana = katakana
        self.reading = reading
        self.id = id
        self.example = example
        self.mistake = mistake
    }
}
