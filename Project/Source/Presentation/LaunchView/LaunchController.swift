//
//  LaunchController.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {

    private let launchScreenInteractor = LaunchScreenInteractor(csvRepository: CSVRepository(manager: CSVManager()), kanaRepository: KanaRepository(store: Stores.shared.kanaStore, mapper: KanaMapper(csvMapper: CSVMapper())), kanjiRepository: KanjiRepository(kanjiMapper: KanjiMapper(csvMapper: CSVMapper()), kanjiStore: Stores.shared.kanjiStore), vocabularyRepository: VocabularyRepository(store: Stores.shared.vocabularyStore, mapper: VocabularyMapper(csvMapper: CSVMapper())))

    override func viewDidLoad() {
        super.viewDidLoad()
        launchScreenInteractor.readFiles(completion: { [weak self] value in
            guard let weakSelf = self else { return }
            weakSelf.navigationController?.pushViewController(ViewControllers.main, animated: true)
        })
    }
}
