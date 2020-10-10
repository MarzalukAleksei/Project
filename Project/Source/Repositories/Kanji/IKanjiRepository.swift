//
//  IKanjiRepository.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

protocol IKanjiRepository {
    
    func toKanji(data: String) -> [KanjiModel]
    
    func storeData(data: [KanjiModel])
    
    func getData() -> [KanjiModel]
    
    func clear()

}
