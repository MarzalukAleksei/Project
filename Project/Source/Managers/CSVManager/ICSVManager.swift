//
//  ICSVManager.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

protocol ICSVManager {
    func readFile(fileName: String) throws -> String
}
