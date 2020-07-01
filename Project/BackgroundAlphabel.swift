//
//  BackgroundAlphabel.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation
import UIKit

let hiragana = ["あ": "a","い": "i","う": "u","え": "e","お": "o","か": "ka","き": "ki","く": "ku","け": "ke","こ": "ko","た": "ta","ち": "chi","つ": "tsu","て": "te","と": "to","さ": "sa","し": "shi","す": "su","せ": "se","そ": "so","は": "ha","ひ": "hi","ふ": "fu","へ": "he","ほ": "ho","ま": "ma","み": "mi","む": "mu","め": "me","も": "mo","な": "na","に": "ni","ぬ": "nu","ね": "ne","の": "no","ら": "ra","り": "ri","る": "ru","れ": "re","ろ": "ro","や": "ya","ゆ": "yu","よ": "yo","わ": "wa","を": "wo","ん": "n","が": "ga","ぎ": "gi","ぐ": "gu","げ": "ge","ご": "go","ば": "ba","び": "bi","ぶ": "bu","べ": "be","ぼ": "bo","ぱ": "pa","ぴ": "pi","ぷ": "pu","ぺ": "pe","ぽ": "po","だ": "da","ぢ": "zi/di","づ": "zu/du","で": "de","ど": "do","ざ": "za","じ": "ji","ず": "zu","ぜ": "ze","ぞ": "zo"]

let katakana = ["ア","イ","ウ","エ","オ","カ","キ","ク","ケ","コ","タ","チ","ツ","テ","ト","サ","シ","ス","セ","ソ","ハ","ヒ","フ","ヘ","ホ","マ","ミ","ム","メ","モ","ナ","ニ","ヌ","ネ","ノ","ラ","リ","ル","レ","ロ","ヤ","ユ","ヨ","ワ","ヲ","ン","ガ","ギ","グ","ゲ","ゴ","バ","ビ","ブ","ベ","ボ","パ","ピ","プ","ペ","ポ","ダ","ヂ","ヅ","デ","ド","ザ","ジ","ズ","ゼ","ゾ"]


func kanaCount() -> Int {
    let count = hiragana.count
    return count
}

// MARK: RANDOM KANA
func randomHiragana() -> String{
    guard let random = hiragana.randomElement() else { return "" }
    return random.key//value
}

func randomKatakana() -> String{
    guard let random = katakana.randomElement() else { return "" }
    return random
}
