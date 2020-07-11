//
//  BackgroundAlphabel.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation
import UIKit

struct Hiragana {
    let kana: String
    let reading: String
    let index: Int
//    var mistake: Bool
}

let hiragana = [Hiragana(kana: "あ", reading: "a", index: 1),Hiragana(kana: "い", reading: "i", index: 2), Hiragana(kana: "う", reading: "u", index: 3)]

//let hiragana = ["あ","い","う","え","お","か","き","く","け","こ","た","ち","つ","て","と","さ","し","す","せ","そ","は","ひ","ふ","へ","ほ","ま","み","む","め","も","な","に","ぬ","ね","の","ら","り","る","れ","ろ","や","ゆ","よ","わ","を","ん","が","ぎ","ぐ","げ","ご","ば","び","ぶ","べ","ぼ","ぱ","ぴ","ぷ","ぺ","ぽ","だ","ぢ","づ","で","ど","ざ","じ","ず","ぜ","ぞ"]

//let hiragana = ["あ": "a","い": "i","う": "u","え": "e","お": "o","か": "ka","き": "ki","く": "ku","け": "ke","こ": "ko","た": "ta","ち": "chi","つ": "tsu","て": "te","と": "to","さ": "sa","し": "shi","す": "su","せ": "se","そ": "so","は": "ha","ひ": "hi","ふ": "fu","へ": "he","ほ": "ho","ま": "ma","み": "mi","む": "mu","め": "me","も": "mo","な": "na","に": "ni","ぬ": "nu","ね": "ne","の": "no","ら": "ra","り": "ri","る": "ru","れ": "re","ろ": "ro","や": "ya","ゆ": "yu","よ": "yo","わ": "wa","を": "wo","ん": "n","が": "ga","ぎ": "gi","ぐ": "gu","げ": "ge","ご": "go","ば": "ba","び": "bi","ぶ": "bu","べ": "be","ぼ": "bo","ぱ": "pa","ぴ": "pi","ぷ": "pu","ぺ": "pe","ぽ": "po","だ": "da","ぢ": "zi","づ": "zu","で": "de","ど": "do","ざ": "za","じ": "ji","ず": "zu","ぜ": "ze","ぞ": "zo"]

//let katakana = ["ア","イ","ウ","エ","オ","カ","キ","ク","ケ","コ","タ","チ","ツ","テ","ト","サ","シ","ス","セ","ソ","ハ","ヒ","フ","ヘ","ホ","マ","ミ","ム","メ","モ","ナ","ニ","ヌ","ネ","ノ","ラ","リ","ル","レ","ロ","ヤ","ユ","ヨ","ワ","ヲ","ン","ガ","ギ","グ","ゲ","ゴ","バ","ビ","ブ","ベ","ボ","パ","ピ","プ","ペ","ポ","ダ","ヂ","ヅ","デ","ド","ザ","ジ","ズ","ゼ","ゾ"]

let katakana = ["ア": "a","イ": "i","ウ": "u","エ": "e","オ": "o","カ":  "ka","キ": "ki","ク": "ku","ケ": "ke","コ": "ko","タ": "ta","チ": "chi","ツ": "tsu","テ": "te","ト": "to","サ": "sa","シ": "shi","ス": "su","セ": "se","ソ": "so","ハ": "ha","ヒ": "hi","フ": "fu","ヘ": "he","ホ": "ho","マ": "ma","ミ": "mi","ム": "mu","メ": "me","モ": "mo","ナ": "na","ニ": "ni","ヌ": "nu","ネ": "ne","ノ": "no","ラ": "ra","リ": "ri","ル": "ru","レ": "re","ロ": "ro","ヤ": "ya","ユ": "yu","ヨ": "yo","ワ": "wa","ヲ": "wo","ン": "n","ガ": "ga","ギ": "gi","グ": "gu","ゲ": "ge","ゴ": "go","バ": "ba","ビ": "bi","ブ": "bu","ベ": "be","ボ": "bo","パ": "pa","ピ": "pi","プ": "pu","ペ": "pe","ポ": "po","ダ": "da","ヂ": "zi","ヅ": "zu","デ": "de","ド": "do","ザ": "za","ジ": "ji","ズ": "zu","ゼ": "ze","ゾ": "zo"]

func kanaCount() -> Int {
    let count = hiragana.count
    return count
}

// MARK: RANDOM KANA

//func randomHiragana() -> String{
//    guard let random = hiragana.randomElement() else { return "" }
//    return random
//}
//
//func randomKatakana() -> String{
//    guard let random = katakana.randomElement() else { return "" }
//    return random
//}

func randomKana(selectKana: [String: String]) -> (key: String, value: String) {
    guard let random = selectKana.randomElement() else { return ("", "") }
    let key = random.key
    let value = random.value
    return (key, value)
}
