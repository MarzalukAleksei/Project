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

enum TypeOfElementForSearchInArray {
    case kanji
    case kana
}

private let CSV = getArrayFromCSV(fileName: "Vocabulary", fileType: "csv")
let vocabulary = transformToVocabulary()

func findElementsInVocabulary(_ string: String, typeOf: TypeOfElementForSearchInArray) -> [Vocabulary] {
    var n5n4levelExamples: [Vocabulary] = []
    var array: [Vocabulary] = []
    switch typeOf {
    case .kanji:
        for item in vocabulary {
            if item.kanji.contains(string) {
                array.append(item)
            }
        }
    case .kana:
        for item in vocabulary {
            if item.level == 5 || item.level == 4 {
                n5n4levelExamples.append(item)
            }
        }
        for item in n5n4levelExamples {
            if item.kana.hasPrefix(string) {
                array.append(item)
            }
        }
        if string == "ん" || string == "ン" {
            array.append(Vocabulary(kanji: "", kana: "Слово не может начинаться на \(string)", translate: "", level: 0))
        }
    }
    return array
}

private func transformToVocabulary() -> [Vocabulary] {
    var array = [Vocabulary]()
    var element = Vocabulary(kanji: "", kana: "", translate: "", level: 0)
    for item in CSV {
        element.kanji = item["Кандзи"] ?? ""
        element.kana = item["Кана"] ?? ""
        element.translate = item["Перевод"] ?? ""
        element.level = Int(item["Уровень"] ?? "") ?? 0
        if element.kanji != "" && element.kana != "" && element.translate != "" && element.level != 0 {
            array.append(element)
        }
    }
    return array
}
