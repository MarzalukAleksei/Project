//
//  CSVAction.swift
//  Project
//
//  Created by ブラック狼 on 14.08.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

func getArrayFromCSV(fileName: String, fileType: String) -> [[String: String]] {
    convertCSV(file: readFile(fileName: fileName, fileType: fileType))
    return data
}

    var titles = [String]()
    var data: [[String: String]] = []
    
private func convertCSV(file: String) {
    let rows = cleanCSV(File: file).components(separatedBy: "\n")
    if rows.count > 0 {
        data = []
        titles = separateStringToArray(string: rows.first!)
        for row in rows {
        let fields = separateStringToArray(string: row)
            if fields != titles {
            var dataRow = [String: String]()
                for (index, field) in fields.enumerated() {
                    dataRow[titles[index]] = field
                }
                data += [dataRow]
            }
        }
    }
}

private func separateStringToArray(string: String) -> [String] {
    return string.components(separatedBy: ",")
}

private func cleanCSV(File file: String) -> String { // убирает \r в конце строки
    var cleanFile = file
//    cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
//    cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\r\n", with: "\n")
    return cleanFile
}

private func readFile(fileName: String, fileType: String) -> String {
    let fileUrl = Bundle.main.path(forResource: fileName, ofType: fileType)
    var csvString = ""
    do {
        guard let url = fileUrl else { return "" }
        csvString = try String(contentsOfFile: url)
    } catch let error as NSError {
        print(error)
    }
    return csvString
}
   
// MARK: Test actiom with array
//
//func getArrayCSV() -> [String] {
//    let csv = cleanCSV(File: readFile())
////    let csv = readFile()
//    var array: [String] = []
//    var stringToArray = ""
//    for character in csv {
//        if character != "," {
//            stringToArray += String(character)
//        } else if character == "," && stringToArray != "" {
//            array.append(stringToArray)
//            stringToArray = ""
//        }
//    }
//    return array
//}

