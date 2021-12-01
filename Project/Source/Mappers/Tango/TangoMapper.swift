//
//  TangoMapper.swift
//  Project
//
//  Created by ブラック狼 on 18.01.2021.
//  Copyright © 2021 ブラック狼. All rights reserved.
//

import Foundation

class TangoMapper: IMapper {
    
    typealias Entity = String
    typealias Result = [TangoModel]
    
    private let csvMapper: CSVMapper
    
    init(csvMapper: CSVMapper) {
        self.csvMapper = csvMapper
    }
    
    func transform(entity: Entity) -> Result {
        var result = [TangoModel]()
        var stringArray = csvMapper.transform(entity: entity)
        guard stringArray.count != 0 else { return result }
        stringArray.removeFirst()
        for row in stringArray {
            let rowData = row.components(separatedBy: ",")
//            guard let unitStr = rowData.first else { continue }
            let unit = rowData[0]
            let tango = rowData[1]
            let reading = rowData[2]
            let tangoTranslate = rowData[3]
            let examples = rowData[4]
            let examplesTranslate = rowData[5]
            let model = TangoModel(unit: unit, tango: tango, reading: reading, tangoTranslate: tangoTranslate, example: [examples], exampleTranslate: [examplesTranslate])
            result.append(model)
        }
        
        return result
    }
    
}
