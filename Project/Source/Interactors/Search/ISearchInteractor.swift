//
//  ISearchInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/17/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

protocol ISearchInteractor {
    
    func getKana() -> [KanaModel]
    func getKanji() -> [KanjiModel]
}
