//
//  SearchInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/17/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class SearchInteractor: ISearchInteractor {
   
    private let kanaRepository: IKanaRepository
    private let kanjiRepository: IKanjiRepository
    
    
    init(kanaRepository: IKanaRepository, kanjiRepository: IKanjiRepository) {
        self.kanaRepository = kanaRepository
        self.kanjiRepository = kanjiRepository
    }
    
    func getKana() -> [KanaModel] {
        return kanaRepository.getData()
    }
    
    func getKanji() -> [KanjiModel] {
        return kanjiRepository.getData()
    }
}
