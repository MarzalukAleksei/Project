//
//  BackgroundInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class BackgroundInteractor: IBackgroundInteractor {
    
    private let kanjiRepository: IKanjiRepository
    
    init(kanjiRepository: IKanjiRepository) {
        self.kanjiRepository = kanjiRepository
    }
    
    func getKanji() -> [KanjiModel] {
        return kanjiRepository.getData()
    }
}
