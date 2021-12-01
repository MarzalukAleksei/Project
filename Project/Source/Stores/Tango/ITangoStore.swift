//
//  ITangoStore.swift
//  Project
//
//  Created by ブラック狼 on 13.03.2021.
//  Copyright © 2021 ブラック狼. All rights reserved.
//

protocol ITangoStore {
    
    func storeData(data: [TangoModel] )
    func getData() -> [TangoModel]
    func clear()
}
