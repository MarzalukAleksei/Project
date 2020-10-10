//
//  VocabularyMapper.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/7/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class VocabularyMapper: IMapper {
    
    typealias Entity = String
    typealias Result = [VocabularyModel]
    
    private let csvMapper: CSVMapper
    
    init(csvMapper: CSVMapper) {
        self.csvMapper = csvMapper
    }
    
    func transform(entity: Entity) -> Result {
        var result = [VocabularyModel]()
        var stringArray = csvMapper.transform(entity: entity)
        guard stringArray.count != 0 else { return result }
        stringArray.removeFirst()
        for row in stringArray {
            let rowData = row.components(separatedBy: ",")
            guard rowData.count == 4 else { continue }
            let kanji = String(rowData[0])
            let kana = String(rowData[1])
            let translate = String(rowData[2])
            let levelStr = rowData[3] 
            guard let level = Int(levelStr)else { continue }
            let model = VocabularyModel(kanji: kanji, kana: kana, translate: translate, level: level)
            
            result.append(model)
        }
        return result
    }
}
