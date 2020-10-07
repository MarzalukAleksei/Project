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
            guard rowData.count < 3 else { continue }
           // let model = KanjiModel(number: <#Int#>, level: <#Int#>, body: <#String#>, readingHiragana: <#String#>, readingKatakana: <#String#>, translate: <#String#>)
           // result.append(model)
        }
        return result
    }
}
