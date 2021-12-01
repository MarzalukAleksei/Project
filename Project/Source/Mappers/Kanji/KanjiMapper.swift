//
//  KanjiMapper.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/7/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class KanjiMapper: IMapper {
    
    typealias Entity = String
    typealias Result = [KanjiModel]
    
    private let csvMapper: CSVMapper
    
    init(csvMapper: CSVMapper) {
        self.csvMapper = csvMapper
    }
    
    func transform(entity: Entity) -> Result {
        var result = [KanjiModel]()
        var stringArray = csvMapper.transform(entity: entity)
        guard stringArray.count != 0 else { return result }
        stringArray.removeFirst()
        for row in stringArray {
            let rowData = row.components(separatedBy: ",")
            guard let levelStr = rowData.last, let level = Int(levelStr), level >= 1 , let bodyFirst = rowData.first else { continue } // Убрать проверку level при расширении библиотеки
            let body = String(bodyFirst)
            let translate = String(rowData[1])
            let readingKatakana = String(rowData[2])
            let readingHiragana = String(rowData[3])
            let index = result.count
            let model = KanjiModel( level: level, body: body, readingHiragana: readingHiragana, readingKatakana: readingKatakana, translate: translate, mistake: false, id: index)
            result.append(model)
        }
        return result
    }
}
