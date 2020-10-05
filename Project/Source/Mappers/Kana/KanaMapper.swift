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
        let stringArray = csvMapper.transform(entity: entity)
        if stringArray.count == 0 { return result }
        var data = [[String: String]]()
          
        for row in stringArray {
            let titles = row.components(separatedBy: ",")
              
            var dataRow = [String: String]()
            for (index, field) in titles.enumerated() {
                dataRow[titles[index]] = field
            }
            
            data += [dataRow]
        }
        return result
    }
}
