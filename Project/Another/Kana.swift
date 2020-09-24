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

private func transformToKana(_ typeOf: TypeOfCollectionItem) -> [Kana] {
    var element = Kana(kana: "", reading: "")
    var array = [Kana]()
    let CSV = getArrayFromCSV(fileName: "Kana", fileType: "csv")
    switch typeOf {
    case .hiragana:
        for item in CSV {
            element.kana = item["Хирагана"] ?? ""
            element.reading = item["Звук"] ?? ""
            element.example = item["Пример хирагана"]?.components(separatedBy: "・") ?? []
            element.id = array.count + 1
            if element.kana != "" && element.reading != "" {
                array.append(element)
            }
        }
    case .katakana:
        for item in CSV {
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

enum TypeOfCollectionItem: String {
    case hiragana = "hiragana"
    case katakana = "katakana"
    case kanjiAll = "AllSegue"
    case kanjiN1 = "n1Segue"
    case kanjiN2 = "n2Segue"
    case kanjiN3 = "n3Segue"
    case kanjiN4 = "n4Segue"
    case kanjiN5 = "n5Segue"
}

var newKanjiArray = [Any]()

func getArray( typeOf: TypeOfCollectionItem) -> [Any] {
    switch typeOf {
        case .hiragana: return hiragana
        case .katakana: return katakana
        case .kanjiAll: return selectLevelFromArray(difficultLevel: 0)
        case .kanjiN1: return selectLevelFromArray(difficultLevel: 1)
        case .kanjiN2: return selectLevelFromArray(difficultLevel: 2)
        case .kanjiN3: return selectLevelFromArray(difficultLevel: 3)
        case .kanjiN4: return selectLevelFromArray(difficultLevel: 4)
        case .kanjiN5: return selectLevelFromArray(difficultLevel: 5)
    }
}

private func selectLevelFromArray (difficultLevel: Int) -> [Any] {
    newKanjiArray.removeAll()
    for var element in kanji {
        if element.level == difficultLevel {
            element.id = newKanjiArray.count + 1
            newKanjiArray.append(element)
        } else if difficultLevel == 0 {
            element.id = newKanjiArray.count + 1
            newKanjiArray.append(element)
        }
    }
    return newKanjiArray
}




//func getArray<T>( typeOf: TypeOfCollectionItem) -> [T]? {
//    switch typeOf {
//        case .hiragana: return hiragana as? [T]
//        case .kanji: return kanji as? [T]
//        case .katakana: return katakana as? [T]
//    }
//}

let hiragana = transformToKana(.hiragana)
let katakana = transformToKana(.katakana)

func randomKana<T>(objectArray: [T]) -> (T?) { // крч, это пример джинериков, суть в том, что эта функция работает с любым типом объекта будь то маассив строк или массив цифр, насрать. НО есть проблема в том, что массив  объектов и возвращаемый объект должны быть одного типа в данном случае.
    //ВАЖНО:
    //Не парься, это не лёгкое дерьмо и объясню тебе всё потом, пока рано. Просто чтобы ты знал что такое есть, я написал тебе пример
    guard let random = objectArray.randomElement() else { return nil }
    return random
}
