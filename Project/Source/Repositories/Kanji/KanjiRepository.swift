//
//  KanjiRepository.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class KanjiRepository: IKanjiRepository {

    private let kanjiMapper: KanjiMapper
    private let kanjiStore: IKanjiStore
    
    init(kanjiMapper: KanjiMapper, kanjiStore: IKanjiStore) {
        self.kanjiMapper = kanjiMapper
        self.kanjiStore = kanjiStore
    }
    
    func toKanji(data: String) -> [KanjiModel] {
        return kanjiMapper.transform(entity: data)
    }
    
    func storeData(data: [KanjiModel]) {
        kanjiStore.storeData(data: data)
    }
    
    func getData() -> [KanjiModel] {
        return kanjiStore.getData()
    }
    
    func clear() {
        kanjiStore.clear()
    }
}

