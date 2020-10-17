//
//  BackgroundAlphabel.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanaSetter {

func transformToKana(_ typeOf: TypeOfCollectionItem) -> [KanaModel] {
    let fileReader = FileReader()
    var element = KanaModel(kana: "", reading: "",id: 0, example: [])
    var array = [KanaModel]()
    let fileCSV = fileReader.getArrayFromCSV(fileName: "Kana", fileType: "csv")
    switch typeOf {
    case .hiragana:
        for item in fileCSV {
            element.kana = item["Хирагана"] ?? ""
            element.reading = item["Звук"] ?? ""
            element.example = item["Пример хирагана"]?.components(separatedBy: "・") ?? []
            element.id = array.count + 1
            if element.kana != "" && element.reading != "" {
                array.append(element)
            }
        }
    case .katakana:
        for item in fileCSV {
            element.kana = item["Катакана"] ?? ""
            element.reading = item["Звук"] ?? ""
            element.example = item["Пример катакана"]?.components(separatedBy: "・") ?? []
            element.id = array.count + 1
            if element.kana != "" && element.reading != "" {
                array.append(element)
            }
        }
    case _: break
    }
    return array
}
}
