//
//  BackgroundAlphabel.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation
import UIKit


struct Kana {
    var kana: String
    var reading: String
    var id: Int = 0
    var example: [String] = []
    var mistake: Bool = false
}

class KanaSetter {

func transformToKana(_ typeOf: TypeOfCollectionItem) -> [Kana] {
    let fileReader = FileReader()
    var element = Kana(kana: "", reading: "")
    var array = [Kana]()
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

//func getArray<T>( typeOf: TypeOfCollectionItem) -> [T]? {
//    switch typeOf {
//        case .hiragana: return hiragana as? [T]
//        case .kanji: return kanji as? [T]
//        case .katakana: return katakana as? [T]
//    }
//}

//let hiragana = transformToKana(.hiragana)
//let katakana = transformToKana(.katakana)

func randomKana<T>(objectArray: [T]) -> (T?) { // крч, это пример джинериков, суть в том, что эта функция работает с любым типом объекта будь то маассив строк или массив цифр, насрать. НО есть проблема в том, что массив  объектов и возвращаемый объект должны быть одного типа в данном случае.
    //ВАЖНО:
    //Не парься, это не лёгкое дерьмо и объясню тебе всё потом, пока рано. Просто чтобы ты знал что такое есть, я написал тебе пример
    guard let random = objectArray.randomElement() else { return nil }
    return random
}

}
