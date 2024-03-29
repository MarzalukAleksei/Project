//
//  DifficultySetting.swift
//  Project
//
//  Created by ブラック狼 on 01.12.2021.
//  Copyright © 2021 ブラック狼. All rights reserved.
//

import Foundation
import Metal

extension Array {

    func compareWith<T>(condition select: (Element) -> Bool ) -> [T] { // возвращает массив элементов соответствующих условию
        var newArray = [Any]()
        
        for element in self {
            if select(element) {
                newArray.append(element)
            }
        }
        return newArray as? [T] ?? [T]()
    }
    
    func compareWith(condition select: (VocabularyModel) -> Bool) -> [VocabularyModel] {
        var newArray = [VocabularyModel]()
        
        for element in self {
            guard let element = element as? VocabularyModel else { return newArray }
            if select(element) {
                newArray.append(element)
            }
        }
        return newArray
    }
    
}
