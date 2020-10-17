//
//  BackgroundInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class BackgroundInteractor: IBackgroundInteractor {
    
    private let kanaRepository: IKanaRepository
    
    init(kanaRepository: IKanaRepository) {
        self.kanaRepository = kanaRepository
    }
    
    func getKana() -> [KanaModel] {
        return kanaRepository.getData()
    }
    
}
