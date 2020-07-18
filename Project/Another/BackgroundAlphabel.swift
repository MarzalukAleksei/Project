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
    let kana: String
    let reading: String
    let id: Int
//    var mistake: Bool
}

enum TypeOfCollectionItem {
    case hiragana
    case katakana
    case kanji
}
func getArray( typeOf: TypeOfCollectionItem) -> [Any] {
    switch typeOf {
        case .hiragana: return hiragana
        case .kanji: return kanji
        case .katakana: return katakana 
    }
}

//func getArray<T>( typeOf: TypeOfCollectionItem) -> [T]? {
//    switch typeOf {
//        case .hiragana: return hiragana as? [T]
//        case .kanji: return kanji as? [T]
//        case .katakana: return katakana as? [T]
//    }
//}

let hiragana = [Kana(kana: "あ", reading: "a", id: 1), Kana(kana: "い", reading: "i", id: 2), Kana(kana: "う", reading: "u", id: 3), Kana(kana: "え", reading: "e", id: 4), Kana(kana: "お", reading: "o", id: 5), Kana(kana: "か", reading: "ka", id: 6), Kana(kana: "き", reading: "ki", id: 7), Kana(kana: "く", reading: "ku", id: 8), Kana(kana: "け", reading: "ke", id: 9), Kana(kana: "こ", reading: "ko", id: 10), Kana(kana: "た", reading: "ta", id: 11), Kana(kana: "ち", reading: "chi", id: 12), Kana(kana: "つ", reading: "tsu", id: 13), Kana(kana: "て", reading: "te", id: 14), Kana(kana: "と", reading: "to", id: 15), Kana(kana: "さ", reading: "sa", id: 16), Kana(kana: "し", reading: "shi", id: 17), Kana(kana: "す", reading: "su", id: 18), Kana(kana: "せ", reading: "se", id: 19), Kana(kana: "そ", reading: "so", id: 20), Kana(kana: "は", reading: "ha", id: 21), Kana(kana: "ひ", reading: "hi", id: 22), Kana(kana: "ふ", reading: "fu", id: 23), Kana(kana: "へ", reading: "he", id: 24), Kana(kana: "ほ", reading: "ho", id: 25), Kana(kana: "ま", reading: "ma", id: 26), Kana(kana: "み", reading: "mi", id: 27), Kana(kana: "む", reading: "mu", id: 28), Kana(kana: "め", reading: "me", id: 29), Kana(kana: "も", reading: "mo", id: 30), Kana(kana: "な", reading: "na", id: 31), Kana(kana: "に", reading: "ni", id: 32), Kana(kana: "ぬ", reading: "nu", id: 33), Kana(kana: "ね", reading: "ne", id: 34), Kana(kana: "の", reading: "no", id: 35), Kana(kana: "ら", reading: "ra", id: 36), Kana(kana: "り", reading: "ri", id: 37), Kana(kana: "る", reading: "ru", id: 38), Kana(kana: "れ", reading: "re", id: 39), Kana(kana: "ろ", reading: "ro", id: 40), Kana(kana: "や", reading: "ya", id: 41), Kana(kana: "ゆ", reading: "yu", id: 42), Kana(kana: "よ", reading: "yo", id: 43), Kana(kana: "わ", reading: "wa", id: 44), Kana(kana: "を", reading: "wo", id: 45), Kana(kana: "ん", reading: "n", id: 46), Kana(kana: "が", reading: "ga", id: 47), Kana(kana: "ぎ", reading: "gi", id: 48), Kana(kana: "ぐ", reading: "gu", id: 49), Kana(kana: "げ", reading: "ge", id: 50), Kana(kana: "ご", reading: "go", id: 51), Kana(kana: "ば", reading: "ba", id: 52), Kana(kana: "び", reading: "bi", id: 53), Kana(kana: "ぶ", reading: "bu", id: 54), Kana(kana: "ベ", reading: "be", id: 55), Kana(kana: "ぼ", reading: "bo", id: 56), Kana(kana: "ぱ", reading: "pa", id: 57), Kana(kana: "ぴ", reading: "pi", id: 58), Kana(kana: "ぷ", reading: "pu", id: 59), Kana(kana: "ぺ", reading: "pe", id: 60), Kana(kana: "ぽ", reading: "po", id: 61), Kana(kana: "だ", reading: "da", id: 62), Kana(kana: "ぢ", reading: "zi", id: 63), Kana(kana: "づ", reading: "zu", id: 64), Kana(kana: "で", reading: "de", id: 65), Kana(kana: "ど", reading: "do", id: 66), Kana(kana: "ざ", reading: "za", id: 67), Kana(kana: "じ", reading: "ji", id: 68), Kana(kana: "ず", reading: "zu", id: 69), Kana(kana: "ぜ", reading: "ze", id: 70), Kana(kana: "ぞ", reading: "zo", id: 71)]

let katakana = [Kana(kana: "ア", reading: "a", id: 1), Kana(kana: "イ", reading: "i", id: 2), Kana(kana: "ウ", reading: "u", id: 3), Kana(kana: "エ", reading: "e", id: 4), Kana(kana: "オ", reading: "o", id: 5), Kana(kana: "カ", reading: "ka", id: 6), Kana(kana: "キ", reading: "ki", id: 7), Kana(kana: "ク", reading: "ku", id: 8), Kana(kana: "ケ", reading: "ke", id: 9), Kana(kana: "コ", reading: "ko", id: 10), Kana(kana: "タ", reading: "ta", id: 11), Kana(kana: "チ", reading: "chi", id: 12), Kana(kana: "ツ", reading: "tsu", id: 13), Kana(kana: "テ", reading: "te", id: 14), Kana(kana: "ト", reading: "to", id: 15), Kana(kana: "サ", reading: "sa", id: 16), Kana(kana: "シ", reading: "shi", id: 17), Kana(kana: "ス", reading: "su", id: 18), Kana(kana: "セ", reading: "se", id: 19), Kana(kana: "ソ", reading: "so", id: 20), Kana(kana: "ハ", reading: "ha", id: 21), Kana(kana: "ヒ", reading: "hi", id: 22), Kana(kana: "フ", reading: "fu", id: 23), Kana(kana: "へ", reading: "he", id: 24), Kana(kana: "ホ", reading: "ho", id: 25), Kana(kana: "マ", reading: "ma", id: 26), Kana(kana: "ミ", reading: "mi", id: 27), Kana(kana: "ム", reading: "mu", id: 28), Kana(kana: "メ", reading: "me", id: 29), Kana(kana: "モ", reading: "mo", id: 30), Kana(kana: "ナ", reading: "na", id: 31), Kana(kana: "ニ", reading: "ni", id: 32), Kana(kana: "ヌ", reading: "nu", id: 33), Kana(kana: "ネ", reading: "ne", id: 34), Kana(kana: "ノ", reading: "no", id: 35), Kana(kana: "ラ", reading: "ra", id: 36), Kana(kana: "リ", reading: "ri", id: 37), Kana(kana: "ル", reading: "ru", id: 38), Kana(kana: "レ", reading: "re", id: 39), Kana(kana: "ロ", reading: "ro", id: 40), Kana(kana: "ヤ", reading: "ya", id: 41), Kana(kana: "ユ", reading: "yu", id: 42), Kana(kana: "ヨ", reading: "yo", id: 43), Kana(kana: "ワ", reading: "wa", id: 44), Kana(kana: "ヲ", reading: "wo", id: 45), Kana(kana: "ン", reading: "n", id: 46), Kana(kana: "ガ", reading: "ga", id: 47), Kana(kana: "ギ", reading: "gi", id: 48), Kana(kana: "グ", reading: "gu", id: 49), Kana(kana: "ゲ", reading: "ge", id: 50), Kana(kana: "ゴ", reading: "go", id: 51), Kana(kana: "バ", reading: "ba", id: 52), Kana(kana: "ビ", reading: "bi", id: 53), Kana(kana: "ブ", reading: "bu", id: 54), Kana(kana: "ベ", reading: "be", id: 55), Kana(kana: "ボ", reading: "bo", id: 56), Kana(kana: "パ", reading: "pa", id: 57), Kana(kana: "ピ", reading: "pi", id: 58), Kana(kana: "プ", reading: "pu", id: 59), Kana(kana: "ぺ", reading: "pe", id: 60), Kana(kana: "ポ", reading: "po", id: 61), Kana(kana: "ダ", reading: "da", id: 62), Kana(kana: "ヂ", reading: "zi", id: 63), Kana(kana: "ヅ", reading: "zu", id: 64), Kana(kana: "デ", reading: "de", id: 65), Kana(kana: "ド", reading: "do", id: 66), Kana(kana: "ザ", reading: "za", id: 67), Kana(kana: "ジ", reading: "ji", id: 68), Kana(kana: "ズ", reading: "zu", id: 69), Kana(kana: "ゼ", reading: "ze", id: 70), Kana(kana: "ゾ", reading: "zo", id: 71)]


func randomKana<T>(objectArray: [T]) -> (T?) { // крч, это пример джинериков, суть в том, что эта функция работает с любым типом объекта будь то маассив строк или массив цифр, насрать. НО есть проблема в том, что массив  объектов и возвращаемый объект должны быть одного типа в данном случае.
    //ВАЖНО:
    //Не парься, это не лёгкое дерьмо и объясню тебе всё потом, пока рано. Просто чтобы ты знал что такое есть, я написал тебе пример
    guard let random = objectArray.randomElement() else { return nil }
    return random
}
