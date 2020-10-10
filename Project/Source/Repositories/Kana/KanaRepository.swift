//
//  KanaRepository.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class KanaRepository: IKanaRepository {
    
    private let store: IKanaStore
    private let mapper: KanaMapper
    
    init(store: IKanaStore, mapper: KanaMapper) {
        self.store = store
        self.mapper = mapper
    }
    
    func toKana(data: String) -> [KanaModel] {
        return mapper.transform(entity: data)
    }
    
    func storeData(data: [KanaModel]) {
        store.storeData(data: data)
    }
    
    func getData() -> [KanaModel] {
        return store.getData()
    }
    
    func clear() {
        store.clear()
    }
    
}
