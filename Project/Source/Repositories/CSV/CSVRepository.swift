//
//  CSVRepository.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class CSVRepository: ICSVRepository {
    
    private let manager: ICSVManager
    
    init(manager: ICSVManager) {
        self.manager = manager
    }
    
    func readFile(fileName: String) throws -> String {
        return try manager.readFile(fileName: fileName)
    }
}
