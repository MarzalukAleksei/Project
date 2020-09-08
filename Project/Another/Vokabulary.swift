//
//  Vocabulary.swift
//  Project
//
//  Created by ブラック狼 on 24.08.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

struct Vocabulary {
    var kanji: String
    var kana: String
    var translate: String
    var level: Int
}

private let CSV = getArrayFromCSV(fileName: "Vocabulary", fileType: "csv")

func findElementsInVocabulary(_ string: String) -> [Vocabulary] {
    var array = [Vocabulary]()
    var element = Vocabulary(kanji: "", kana: "", translate: "", level: 0)
    for item in CSV {
        guard let seachElement = item["Кандзи"] else { return [] }
        if seachElement.contains(string) {
            element.kanji = item["Кандзи"] ?? ""
            element.kana = item["Кана"] ?? ""
            element.translate = item["Перевод"] ?? ""
            element.level = Int(item["Уровень"] ?? "") ?? 0
            if element.kanji != "" && element.kana != "" && element.translate != "" && element.level != 0 {
                array.append(element)
            }
        }
    }
    return array
}
