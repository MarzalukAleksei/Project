//
//  Vocabulary.swift
//  Project
//
//  Created by ブラック狼 on 24.08.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

struct VocabularyType {
    var kanji: String
    var kana: String
    var translate: String
    var level: Int
}

class Vocabulary {
    enum TypeOfElementForSearchInArray {
        case kanji
        case kana
    }

   private let fileReader = FileReader()
        
    func findElementsInVocabulary(_ string: String, typeOf: TypeOfElementForSearchInArray) -> [VocabularyType] {
        var n5n4levelExamples: [VocabularyType] = []
        var array: [VocabularyType] = []
        let vocabulary = transformToVocabulary()
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
                array.append(VocabularyType(kanji: "", kana: "Слово не может начинаться на \(string)", translate: "", level: 0))
            }
        }
        return array
    }

    private func transformToVocabulary() -> [VocabularyType] {
        var array = [VocabularyType]()
        var element = VocabularyType(kanji: "", kana: "", translate: "", level: 0)
        for item in fileReader.getArrayFromCSV(fileName: "Vocabulary", fileType: "csv") {
            element.kanji = item["Кандзи"] ?? " "
            element.kana = item["Кана"] ?? ""
            element.translate = item["Перевод"] ?? ""
            element.level = Int(item["Уровень"] ?? "") ?? 0
            if element.kanji != " " && element.kana != "" && element.translate != "" && element.level != 0 {
                array.append(element)
            }
        }
        return array
    }
}


