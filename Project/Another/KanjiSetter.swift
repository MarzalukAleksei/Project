//
//  Kanji.swift
//  Project
//
//  Created by ブラック狼 on 17.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

class KanjiSetter {

    func setKanji() -> [KanjiModel] {
        var element = KanjiModel(level: 0, body: "", readingHiragana: "", readingKatakana: "", translate: "")
        var array: [KanjiModel] = []
        let fileReader = FileReader()
        
        let CSVArray = fileReader.getArrayFromCSV(fileName: "Kanji", fileType: "csv")
        for item in CSVArray {
            element.body = item["Кандзи"] ?? ""
            element.translate = item["Значение"] ?? ""
            element.readingKatakana = item["On"] ?? "ー"
            element.readingHiragana = item["Kun"] ?? "ー"
            element.level = Int(item["Level"] ?? "") ?? 0
            if element.body != "" && element.translate != "" && element.level != 0 {
                array.append(element)
            }
        }
        return array
    }
}
