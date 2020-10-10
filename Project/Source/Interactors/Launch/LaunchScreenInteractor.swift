//
//  LaunchScreenInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

private enum Files: String {
    case kana = "Kana"
    case kanji = "Kanji"
    case vocabulary = "Vocabulary"
}

class LaunchScreenInteractor: ILaunchScreenInteractor {
    
    private let csvRepository: ICSVRepository
    private let kanaRepository: IKanaRepository
    private let kanjiRepository: IKanjiRepository
    private let vocabularyRepository: IVocabularyRepository
    
    init(csvRepository: ICSVRepository, kanaRepository: IKanaRepository, kanjiRepository: IKanjiRepository, vocabularyRepository: IVocabularyRepository) {
        self.csvRepository = csvRepository
        self.kanaRepository = kanaRepository
        self.kanjiRepository = kanjiRepository
        self.vocabularyRepository = vocabularyRepository
    }
    
    func readFiles(completion: @escaping(Bool) -> Void) {
        
        guard let kanaValues = try? csvRepository.readFile(fileName: Files.kana.rawValue) else { return }
        let kanaData = kanaRepository.toKana(data: kanaValues)
        kanaRepository.storeData(data: kanaData)
        
        
        
        guard let kanjiValues = try? csvRepository.readFile(fileName: Files.kanji.rawValue) else { return }
        let kanjiData = kanjiRepository.toKanji(data: kanjiValues)
        kanjiRepository.storeData(data: kanjiData)
        
        
        guard let vocabulary = try? csvRepository.readFile(fileName: Files.vocabulary.rawValue) else { return }
        let vocabularyData = vocabularyRepository.toVocabulary(data: vocabulary)
        vocabularyRepository.storeData(data: vocabularyData)
        
        completion(true)
    }
}
