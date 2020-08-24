//
//  Vocabulary.swift
//  Project
//
//  Created by ブラック狼 on 24.08.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

private let CVS = getArrayFromCSV(fileName: "Vocabulary", fileType: "csv")

func searchReadingInVocabularyForKanji(_ string: String) -> String {
    for item in CVS {
        guard let element = item["Слово"] else { return "" }
        guard let reading = item["Чтение"] else { return "" }
        if string == element {
            return reading
        }
    }
    return ""
}

func searchTranslateInVacabularyForKanji(_ string: String) -> String {
    for item in CVS {
        guard let element = item["Слово"] else { return "" }
        guard let translate = item["Перевод"] else { return "" }
        if string == element {
            return translate
        }
    }
    return ""
}

//func searchReadingForKana() {
//    for item in CSV {
//
//    }
//}
