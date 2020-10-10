//
//  KanaStore.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class KanaStore: IKanaStore {
    
    private var data = [KanaModel]()
    
    func storeData(data: [KanaModel]) {
        self.data = data
    }
    
    func clear() {
        data.removeAll()
    }
    
    func getData() -> [KanaModel] {
        return data
    }
    
}


