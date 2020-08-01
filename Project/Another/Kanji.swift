//
//  Kanji.swift
//  Project
//
//  Created by ブラック狼 on 17.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

struct Kanji {
    let number: Int
    let level: Int
    let body: String
    let readingHiragana: String
    let readingKatakana: String
    let translate: String
    var mistake: Bool = false
    var id: Int = 0
}


let kanji = [Kanji(number: 1, level: 5, body: "一", readingHiragana: "ひと、 ひとつ", readingKatakana: "イチ", translate: "Один"), Kanji(number: 2, level: 5, body: "二", readingHiragana: "ふた、ふたつ", readingKatakana: "ニ", translate: "Два"),Kanji(number: 3, level: 5, body: "三", readingHiragana: "み、みつ", readingKatakana: "サン", translate: "Три"),Kanji(number: 4, level: 5, body: "四", readingHiragana: "よ、よつ、よん", readingKatakana: "シ", translate: "Четыре"),Kanji(number: 5, level: 5, body: "五", readingHiragana: "いつ、いつつ", readingKatakana: "ゴ", translate: "Пять"),Kanji(number: 6, level: 5, body: "六", readingHiragana: "む、むつ、むい", readingKatakana: "ロク", translate: "Шесть"),Kanji(number: 7, level: 5, body: "七", readingHiragana: "なな、ななつ", readingKatakana: "シチ", translate: "Семь"),Kanji(number: 8, level: 5, body: "八", readingHiragana: "や、やつ", readingKatakana: "ハチ", translate: "Восемь"),Kanji(number: 9, level: 5, body: "九", readingHiragana: "ここの、ここのつ", readingKatakana: "キュウ", translate: "Девять"),Kanji(number: 10, level: 5, body: "十", readingHiragana: "と、とお", readingKatakana: "ジュウ", translate: "Десять"), Kanji(number: 11, level: 1, body: "TestN1", readingHiragana: "TestN1", readingKatakana: "TN1", translate: "TestN1"), Kanji(number: 12, level: 2, body: "TN2", readingHiragana: "TestN2", readingKatakana: "TestN2", translate: "TestN2"), Kanji(number: 13, level: 3, body: "TN3", readingHiragana: "TestN3", readingKatakana: "TestN3", translate: "TestN3"), Kanji(number: 14, level: 4, body: "TN4", readingHiragana: "TestN4", readingKatakana: "TestN4", translate: "TestN4")]


