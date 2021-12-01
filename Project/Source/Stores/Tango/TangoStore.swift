//
//  TangoStore.swift
//  Project
//
//  Created by ブラック狼 on 13.03.2021.
//  Copyright © 2021 ブラック狼. All rights reserved.
//

class TangoStore: ITangoStore {
    
    private var data = [TangoModel]()
    
    func storeData(data: [TangoModel]) {
        self.data = data
    }
    
    func getData() -> [TangoModel] {
        return data
    }
    
    func clear() {
        data.removeAll()
    }
    
}
