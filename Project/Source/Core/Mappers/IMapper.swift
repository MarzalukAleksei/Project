//
//  IMapper.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/4/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

protocol IMapper {
    
    associatedtype Entity
    associatedtype Result
    
    func transform(entity: Entity) -> Result
}
