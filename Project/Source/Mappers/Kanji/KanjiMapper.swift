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
        for (index, row) in stringArray.enumerated() {
            let rowData = row.split(separator: ",")

            guard let level = rowData.last, level != "0" && level != "1", let body = rowData.first else { continue }
            let translate = rowData[1]
            let readingKatakana = rowData[2]
            let readingHiragana = rowData[3]
//           let model = KanjiModel(level: level, body: body, readingHiragana: readingHiragana, readingKatakana: readingKatakana, translate: translate, mistake: false, id: 0)
//            result.append(model)
        }
        return result
    }
}
