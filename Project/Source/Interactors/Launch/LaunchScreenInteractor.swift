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
    private let kanaMapper: KanaMapper
    private let kanjiMapper: KanjiMapper
    private let vocabularyMapper: VocabularyMapper
    
    init(kanaMapper: KanaMapper, kanjiMapper: KanjiMapper, vocabularyMapper: VocabularyMapper, csvRepository: ICSVRepository) {
        self.kanjiMapper = kanjiMapper
        self.vocabularyMapper = vocabularyMapper
        self.kanaMapper = kanaMapper
        self.csvRepository = csvRepository
    }
    
    func readFiles(completion: @escaping(Bool) -> Void ) {
        guard let kanaValues = try? csvRepository.readFile(fileName: Files.kana.rawValue) else { return }
        let result = kanaMapper.transform(entity: kanaValues)
        print(result)
       
        
        guard let kanjiValues = try? csvRepository.readFile(fileName: Files.kanji.rawValue) else { return }
        let kanjiArray = kanjiMapper.transform(entity: kanjiValues)
        print(kanjiArray)
        
        
        guard let vocabulary = try? csvRepository.readFile(fileName: Files.vocabulary.rawValue) else { return }
        let vocabularyArray = vocabularyMapper.transform(entity: vocabulary)
        print(vocabularyArray)
        completion(true)
    }
}
