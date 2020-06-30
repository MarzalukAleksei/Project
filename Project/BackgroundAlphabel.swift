//
//  BackgroundAlphabel.swift
//  Project
//
//  Created by ブラック狼 on 29.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation
import UIKit

let hiragana = ["あ","い","う","え","お","か","き","く","け","こ","た","ち","つ","て","と","さ","し","す","せ","そ","は","ひ","ふ","へ","ほ","ま","み","む","め","も","な","に","ぬ","ね","の","ら","り","る","れ","ろ","や","ゆ","よ","わ","を","ん","が","ぎ","ぐ","げ","ご","ば","び","ぶ","べ","ぼ","ぱ","ぴ","ぷ","ぺ","ぽ","だ","ぢ","づ","で","ど","ざ","じ","ず","ぜ","ぞ"]

let katakana = ["ア","イ","ウ","エ","オ","カ","キ","ク","ケ","コ","タ","チ","ツ","テ","ト","サ","シ","ス","セ","ソ","ハ","ヒ","フ","ヘ","ホ","マ","ミ","ム","メ","モ","ナ","ニ","ヌ","ネ","ノ","ラ","リ","ル","レ","ロ","ヤ","ユ","ヨ","ワ","ヲ","ン","ガ","ギ","グ","ゲ","ゴ","バ","ビ","ブ","ベ","ボ","パ","ピ","プ","ペ","ポ","ダ","ヂ","ヅ","デ","ド","ザ","ジ","ズ","ゼ","ゾ"]


func kanaCount() -> Int {
    let count = hiragana.count
    return count
}

// MARK: RANDOM KANA
func randomHiragana() -> String{
    guard let random = hiragana.randomElement() else { return "" }
    return random
}

func randomKatakana() -> String{
    guard let random = katakana.randomElement() else { return "" }
    return random
}
