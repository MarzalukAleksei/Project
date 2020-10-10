//
//  IKanaStore.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

protocol IKanaStore {
   
    func storeData(data: [KanaModel])
    
    func getData() -> [KanaModel]
    
    func clear()
}
