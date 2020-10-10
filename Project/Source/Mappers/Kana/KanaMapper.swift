//
//  Kana.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/4/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class KanaMapper: IMapper {
    
    typealias Entity = String
    typealias Result = [KanaModel]
    
    private let csvMapper: CSVMapper
    
    init(csvMapper: CSVMapper) {
        self.csvMapper = csvMapper
    }
    
    func transform(entity: Entity) -> Result {
        var result = [KanaModel]()
        var stringArray = csvMapper.transform(entity: entity)
        guard stringArray.count != 0 else { return result }
        stringArray.removeFirst()
        for (index, row) in stringArray.enumerated() {
            let rowData = row.components(separatedBy:  ",")
            guard rowData.count > 2 else { continue }
            let model = KanaModel(kana: String(rowData[0]), reading: String(rowData[1]), id: index, example: [])
            result.append(model)
        }
        return result
    }
}
