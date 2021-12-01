//
//  TangoRepositories.swift
//  Project
//
//  Created by ブラック狼 on 13.03.2021.
//  Copyright © 2021 ブラック狼. All rights reserved.
//

class TangoRepository: ITangoRepository {
    
    private let store: ITangoStore
    private let mapper: TangoMapper
    
    init(store: ITangoStore, mapper: TangoMapper) {
        self.store = store
        self.mapper = mapper
    }
    
    func toTango(data: String) -> [TangoModel] {
        mapper.transform(entity: data)
    }
    
    func storeData(data: [TangoModel]) {
        store.storeData(data: data)
    }
    
    func getData() -> [TangoModel] {
        return store.getData()
    }
    
    func clear() {
        store.clear()
    }
    
}
