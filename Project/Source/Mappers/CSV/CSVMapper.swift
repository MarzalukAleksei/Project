//
//  CSVMapper.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class CSVMapper: IMapper {
    
    typealias Entity = String
    
    typealias Result = [String]
    
    func transform(entity: Entity) -> Result {
        let newStr = entity.replacingOccurrences(of: "\r", with: "", options: .literal, range: nil)
        return Array(newStr.split(separator: "\n")).map { String($0) }
    }
}
