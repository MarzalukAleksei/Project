//
//  DetailViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var previousButtonOutlet: UIButton!
    @IBOutlet private weak var nextButtonOutlet: UIButton!
    @IBOutlet private weak var bottomView: BottomView!
    
    var startElement: Any?
    var typeOfColletion: TypeOfCollectionItem?
    var twoDemensionalArray: [SectionsInTableView: [Any]] = [:]
    var array: [Any]?
    var previousElement: Any?
    var nextElement: Any?
    let kunLabel = "訓: "
    let onLabel = "音: "
    let imiLabel = "意味: "

    enum SectionsInTableView: Int {
        case main = 0, examples = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
        viewParameters()
        changeCollectionArray()
        setTwoDemensionalArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupElement()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    private func prepareViewController() {
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTwoDemensionalArray() { // отображение данных в таблице
        let vocabulary = VocabularySetter()
        switch startElement {
        case is KanjiModel:
            guard let startElement = startElement as? KanjiModel else { return }
            let examplesSection = vocabulary.findElementsInVocabulary(startElement.body, typeOf: .kanji)
            var array = [Any]()
            array.append(kunLabel + startElement.readingHiragana)
            array.append(onLabel + startElement.readingKatakana)
            array.append(imiLabel + startElement.translate)
            twoDemensionalArray[.main] = array
            twoDemensionalArray[.examples] = examplesSection
        case is KanaModel:
            guard let startElement = startElement as? KanaModel else { return }
            var array = [Any]()
            array.append(startElement.reading)
            twoDemensionalArray[.main] = array
            twoDemensionalArray[.examples] = vocabulary.findElementsInVocabulary(startElement.katakana, typeOf: .kana)
        case is VocabularyModel:
            twoDemensionalArray[.main] = [startElement as Any]
        default: break
        }
    }
    
    func viewParameters() {
        bottomView.delegate = self
        tableView.allowsSelection = false
        let designElementCornerRadius: CGFloat = 0.2
        previousButtonOutlet.layer.cornerRadius = previousButtonOutlet.bounds.size.width * designElementCornerRadius
        nextButtonOutlet.layer.cornerRadius = nextButtonOutlet.bounds.size.width * designElementCornerRadius
    }
    
    func changeCollectionArray() {
        switch typeOfColletion {
        case .hiragana, .katakana:
            array = Stores.shared.kanaStore.getData()
        case .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            guard let startElement = startElement as? KanjiModel else { return }
            array = Stores.shared.kanjiStore.getData().compareWith(condition: { $0.level == startElement.level})
        case .kanjiAll:
            array = Stores.shared.kanjiStore.getData()
        default: break
        }
    }
    
    func setupElement() { // устрановка стартовых значений экрана
        var detail = ""
        var previous = ""
        var next = ""
        switch typeOfColletion {
        case .hiragana:
            guard let startElement = startElement as? KanaModel,
                  let array = array as? [KanaModel],
                  let index = array.firstIndex(where: { $0.hiragana == startElement.hiragana }) else { return }
            detail = startElement.hiragana
            if array.count > 1 {
                if index == 0 {
                    next = array[index + 1].hiragana
                } else if index == array.count - 1 {
                    previous = array[index - 1].hiragana
                } else {
                    next = array[index + 1].hiragana
                    previous = array[index - 1].hiragana
                }
            }
        case .katakana:
            guard let startElement = startElement as? KanaModel,
                  let array = array as? [KanaModel],
                  let index = array.firstIndex(where: { $0.katakana == startElement.katakana }) else { return }
            detail = startElement.katakana
            if array.count > 1 {
                if index == 0 {
                    next = array[index + 1].katakana
                } else if index == array.count - 1 {
                    previous = array[index - 1].katakana
                } else {
                    next = array[index + 1].katakana
                    previous = array[index - 1].katakana
                }
            }
        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            guard let startElement = startElement as? KanjiModel,
                  let array = array as? [KanjiModel],
                  let index = array.firstIndex(where: { $0.body == startElement.body }) else { return }
            detail = array[index].body
            if array.count > 1 {
                if index == 0 {
                    next = array[index + 1].body
                } else if index == array.count - 1 {
                    previous = array[index - 1].body
                } else {
                    next = array[index + 1].body
                    previous = array[index - 1].body
                }
        }
        case _: break
        }
        detailLabel.text = detail
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    func leftButtonAction() {
        var detail = detailLabel.text
        var previous = previousButtonOutlet.currentTitle
        var next = nextButtonOutlet.currentTitle
        
        switch typeOfColletion {
        case .hiragana:
            guard let startElement = startElement as? KanaModel,
                  let array = array as? [KanaModel],
                  let index = array.firstIndex(where: { $0.hiragana == startElement.hiragana }) else { return }
            if array.count > 1 {
                if index == 1 {
                    detail = array[index - 1].hiragana
                    previous = ""
                    next = array[index].hiragana
                    self.startElement = array[index - 1]
                } else if index > 0 {
                    detail = array[index - 1].hiragana
                    previous = array[index - 2].hiragana
                    next = array[index].hiragana
                    self.startElement = array[index - 1]
                }
            }
        case .katakana:
            guard let startElement = startElement as? KanaModel,
                  let array = array as? [KanaModel],
                  let index = array.firstIndex(where: { $0.katakana == startElement.katakana}) else { return }
            if array.count > 1 {
                if index == 1 {
                    detail = array[index - 1].katakana
                    previous = ""
                    next = array[index].katakana
                    self.startElement = array[index - 1]
                } else if index > 0 {
                    detail = array[index - 1].katakana
                    previous = array[index - 2].katakana
                    next = array[index].katakana
                    self.startElement = array[index - 1]
                }
            }
        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            guard let startElement = startElement as? KanjiModel,
                  let array = array as? [KanjiModel],
                  let index = array.firstIndex(where: { $0.body == startElement.body}) else { return }
            if array.count > 1 {
                if index == 1 {
                    detail = array[index - 1].body
                    previous = ""
                    next = array[index].body
                    self.startElement = array[index - 1]
                } else if index > 0 {
                    detail = array[index - 1].body
                    previous = array[index - 2].body
                    next = array[index].body
                    self.startElement = array[index - 1]
                }
            }
        case _: break
        }
        detailLabel.text = detail
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    func rightButtonAction() {
        var detail = detailLabel.text
        var previous = previousButtonOutlet.currentTitle
        var next = nextButtonOutlet.currentTitle
        switch typeOfColletion {
        case .hiragana:
            guard let startElement = startElement as? KanaModel,
                  let array = array as? [KanaModel],
                  let index = array.firstIndex(where: { $0.hiragana == startElement.hiragana }) else { return }
            if array.count > 1 {
                if array.count - 2 == index {
                    detail = array[index + 1].hiragana
                    next = ""
                    previous = array[index].hiragana
                    self.startElement = array[index + 1]
                } else if array.count - 2 > index {
                    detail = array[index + 1].hiragana
                    next = array[index + 2].hiragana
                    previous = array[index].hiragana
                    self.startElement = array[index + 1]
                }
            }
        case .katakana:
            guard let startElement = startElement as? KanaModel,
                  let array = array as? [KanaModel],
                  let index = array.firstIndex(where: { $0.katakana == startElement.katakana }) else { return }
            if array.count > 1 {
                if array.count - 2 == index {
                    detail = array[index + 1].katakana
                    next = ""
                    previous = array[index].katakana
                    self.startElement = array[index + 1]
                } else if array.count - 2 > index {
                    detail = array[index + 1].katakana
                    next = array[index + 2].katakana
                    previous = array[index].katakana
                    self.startElement = array[index + 1]
                }
            }
        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            guard let startElement = startElement as? KanjiModel,
                  let array = array as? [KanjiModel],
                  let index = array.firstIndex(where: { $0.body == startElement.body }) else { return }
            if array.count > 1 {
                if array.count - 2 == index {
                    detail = array[index + 1].body
                    next = ""
                    previous = array[index].body
                    self.startElement = array[index + 1]
                } else if array.count - 2 > index {
                    detail = array[index + 1].body
                    next = array[index + 2].body
                    previous = array[index].body
                    self.startElement = array[index + 1]
                }
            }
        default: break
        }
        detailLabel.text = detail
        previousButtonOutlet.setTitle(previous, for: .normal)
        nextButtonOutlet.setTitle(next, for: .normal)
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        leftButtonAction()
        setTwoDemensionalArray()
        tableView.reloadData()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        rightButtonAction()
        setTwoDemensionalArray()
        tableView.reloadData()
    }
}

