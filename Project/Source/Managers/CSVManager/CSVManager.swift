//
//  CSVManager.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

class CSVManager: ICSVManager {
    
    func readFile(fileName: String) throws -> String {
        let fileType = "csv"
        let fileUrl = Bundle.main.path(forResource: fileName, ofType: fileType)
      
        do {
            guard let url = fileUrl else { return "" }
            return try String(contentsOfFile: url)
        } catch {
            throw error
        }
    }
}
