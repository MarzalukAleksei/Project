//
//  KanaModel.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

struct KanaModel {
    var kana: String
    var reading: String
    var id: Int = 0
    var example: [String] = []
    var mistake: Bool = false
    
    init(kana: String, reading: String, id: Int , example: [String], mistake: Bool = false) {
        self.kana = kana
        self.reading = reading
        self.id = id
        self.example = example
        self.mistake = mistake
    }
}
