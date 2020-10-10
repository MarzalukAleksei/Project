//
//  Vocabulary.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class Vocabulary: IVocabulary {
 
    private var data = [VocabularyModel]()
    
    func storeDat(data: [VocabularyModel]) {
        self.data = data
    }
    
    func clearData() {
        data.removeAll()
    }
}
