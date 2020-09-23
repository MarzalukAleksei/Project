//
//  TestFile.swift
//  Project
//
//  Created by ブラック狼 on 23.09.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

let dictionaryArray = getArrayFromCSV(fileName: "AllKanjiListFromSite", fileType: "csv")

var mainTestArrray = [Kanji]()
var newTestArray = [Kanji]()
var printing = [Kanji]()

func printTestArray() {
    setIdToTestArray()
    var count = 0
    for newTestArrayElement in newTestArray {
        for item in kanji {
            if newTestArrayElement.body == item.body && newTestArrayElement.level != item.level {
                count = count + 1
                print("kanji \(item.body), \(item.level) || TestArray \(newTestArrayElement.body), \(newTestArrayElement.level) \(count)")
//                printing.append(item)
            }
        }
    }
//    print(printing)
    for item in kanji {
        if item.level == 5 {
            printing.append(item)
        }
    }
    print(printing.count)
}

func setIdToTestArray() {
    appendElementToMainArray()
    for var item in mainTestArrray {
        item.id = newTestArray.count
        newTestArray.append(item)
    }
}

func appendElementToMainArray() {
    mainTestArrray = fiveArray(level: 5) + fiveArray(level: 4) + fiveArray(level: 3) + fiveArray(level: 2) + fiveArray(level: 1)
}

func fiveArray(level: Int) -> [Kanji] {
    var array = [Kanji]()
    var element = Kanji(number: 0, level: 0, body: "", readingHiragana: "", readingKatakana: "", translate: "")
    switch level {
    case 5:
        for item in dictionaryArray {
            element.body = item["N5"] ?? ""
            element.level = 5
            if element.body != "" {
                array += [element]
            }
        }
    case 4:
    for item in dictionaryArray {
        element.body = item["N4"] ?? ""
        element.level = 4
        if element.body != "" {
            array += [element]
        }
    }
    case 3:
    for item in dictionaryArray {
        element.body = item["N3"] ?? ""
        element.level = 3
        if element.body != "" {
            array += [element]
        }
    }
    case 2:
    for item in dictionaryArray {
        element.body = item["N2"] ?? ""
        element.level = 2
        if element.body != "" {
            array += [element]
        }
    }
    case 1:
    for item in dictionaryArray {
        element.body = item["N1"] ?? ""
        element.level = 1
        if element.body != "" {
            array += [element]
        }
    }
    default:
        break
    }
    return array
}
