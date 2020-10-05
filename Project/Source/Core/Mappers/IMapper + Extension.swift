//
//  IMapper + Extension.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/4/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

extension IMapper {
    func transform(entities: Array<Entity>) -> Array<Result> {
        var result = Array<Result>()
        result.reserveCapacity(result.count)
        entities.forEach { entity in
            result.append(transform(entity: entity))
        }
        return result
    }
}
