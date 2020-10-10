//
//  KanjiStore.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class KanjiStore: IKanjiStore {
    
    private var data = [KanjiModel]()
    
    func storeData(data: [KanjiModel]) {
        self.data = data
    }
    
    func getData() -> [KanjiModel] {
        return data
    }
    
    func clear() {
        data.removeAll()
    }
}
