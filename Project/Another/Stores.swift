//
//  Stores.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/10/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation

class Stores {
    static let shared = Stores()
    
    let kanaStore = KanaStore()
    let kanjiStore = KanjiStore()
    let vocabularyStore = VocabularyStore()
    let tangoStore = TangoStore()
}
