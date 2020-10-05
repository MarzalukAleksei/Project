//
//  LaunchScreenInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class LaunchScreenInteractor: ILaunchScreenInteractor {
    private let csvRepository: ICSVRepository
    private let kanaMapper: KanaMapper
    
    init(kanaMapper: KanaMapper, csvRepository: ICSVRepository) {
        self.kanaMapper = kanaMapper
        self.csvRepository = csvRepository
    }
    
    func readFiles(completion: @escaping(Bool) -> Void ) {
        guard let kanaValues = try? csvRepository.readFile(fileName: Files.kana.rawValue) else { return }
        let result = kanaMapper.transform(entity: kanaValues)
        print(result)
       
        
        guard let kanjiValues = try? csvRepository.readFile(fileName: Files.kanji.rawValue) else { return }
        let kanjiArray = kanaMapper.transform(entity: kanjiValues)
        print(kanjiArray)
        
        
        guard let vocabulary = try? csvRepository.readFile(fileName: Files.vocabulary.rawValue) else { return }
        let vocabularyArray = kanaMapper.transform(entity: vocabulary)
        print(vocabularyArray)
        completion(true)
    }
    
    private func cleanString(input: String) -> [String] {
        let newStr = input.replacingOccurrences(of: "\r", with: "", options: .literal, range: nil)
        return Array(newStr.split(separator: "\n")).map { String($0) }
    }
}

private enum Files: String {
    case kana = "Kana"
    case kanji = "Kanji"
    case vocabulary = "Vocabulary"
}
    
