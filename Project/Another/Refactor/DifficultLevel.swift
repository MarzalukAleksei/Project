//
//  DifficultLevel.swift
//  Project
//
//  Created by ブラック狼 on 25.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

class DifficultLevel {
    
func selectLevelFromArray (difficultLevel: Int) -> [Any] {
    let kanji = KanjiSetter()
    var kanjiArray = [Any]()
    for var element in kanji.setKanji() {
        if element.level == difficultLevel {
            element.id = kanjiArray.count + 1
            kanjiArray.append(element)
        } else if difficultLevel == 0 {
            element.id = kanjiArray.count + 1
            kanjiArray.append(element)
        }
    }
    return kanjiArray
}
    
func getArray(typeOf: TypeOfCollectionItem) -> [Any] {
    let kana = KanaSetter()
    switch typeOf {
        case .hiragana: return kana.transformToKana(.hiragana)
        case .katakana: return kana.transformToKana(.katakana)
        case .kanjiAll: return selectLevelFromArray(difficultLevel: 0)
        case .kanjiN1: return selectLevelFromArray(difficultLevel: 1)
        case .kanjiN2: return selectLevelFromArray(difficultLevel: 2)
        case .kanjiN3: return selectLevelFromArray(difficultLevel: 3)
        case .kanjiN4: return selectLevelFromArray(difficultLevel: 4)
        case .kanjiN5: return selectLevelFromArray(difficultLevel: 5)
        }
    }
}
