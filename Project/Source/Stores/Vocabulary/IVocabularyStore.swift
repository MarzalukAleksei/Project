//
//  IVocabulary.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

protocol IVocabularyStore {
    
    func storeDat(data: [VocabularyModel])
    
    func getData() -> [VocabularyModel]
    
    func clear()
}
