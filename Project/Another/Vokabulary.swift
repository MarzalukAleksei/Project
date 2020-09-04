//
//  Vocabulary.swift
//  Project
//
//  Created by ブラック狼 on 24.08.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

private let CSV = getArrayFromCSV(fileName: "Vocabulary", fileType: "csv")

func readingTableViewCell(_ string: String) -> String {
    for item in CSV {
        guard let element = item["Кандзи"] else { return " " }
        guard let reading = item["Кана"] else { return " " }
        if element == string {
            return reading
        }
    }
    return " "
}

// почему гуард работает неправильно??

func translateTableVIewCell(_ string: String) -> String {
    for item in CSV {
        guard let element = item["Кандзи"] else { return " " }
//        guard let translate = item["Перевод"] else { return "баг" }
        if element == string {
//            return translate
            return item["Перевод"]!

        }
    }
    return " "
}

func findExampleInVocablary(_ string: String) -> [String] {
    var array = [String]()
    for item in CSV {
        guard let element = item["Кандзи"] else { return [] }
        if element.contains(string) {
            array.append(element)
        }
    }
    return array
}
