//
//  VocabularyRepository.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class VocabularyRepository: IVocabularyRepository {
   
    private let store: IVocabularyStore
    private let mapper: VocabularyMapper
    
    init(store: IVocabularyStore, mapper: VocabularyMapper) {
        self.store = store
        self.mapper = mapper
    }
    
    func toVocabulary(data: String) -> [VocabularyModel] {
        return mapper.transform(entity: data)
    }
    
    func storeData(data: [VocabularyModel]) {
        store.storeDat(data: data)
    }
    
    func getData() -> [VocabularyModel] {
        return store.getData()
    }
    
    func clear() {
        store.clear()
    }
}
