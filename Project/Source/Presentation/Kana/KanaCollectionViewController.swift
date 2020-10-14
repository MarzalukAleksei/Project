//
//  CollectionViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanaViewController: UIViewController {

    @IBOutlet private weak var bottomView: BottomView!
    @IBOutlet private weak var collection: UICollectionView!
    
    let itemsAtRow = itemsInCollectionView
    let sectionInsets = UIEdgeInsets(top: edgeInCollectionViewTop, left: edgeInCollectionViewLeft, bottom: edgeInCollectionViewBottom, right: edgeInCollectionViewRight)

    var typeOfCollection: TypeOfCollectionItem?

    var arrayOfElements = [Any]()

    let difficult = DifficultLevel()

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareViewController()
    }

    private func prepareViewController() {
        guard let type = typeOfCollection else { return }
        arrayOfElements = difficult.getArray(typeOf: type)
        collection.register(UINib(nibName: "KanaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "KanaCollectionViewCell")
        collection.delegate = self
        collection.dataSource = self
        bottomView.delegate = self
    }
    
    func pushToNextViewController(element: Any) {
        let vc = ViewControllers.detail
        vc.startElement = element
        vc.typeOfColletion = typeOfCollection
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func elementByIndex(array: [Any], index: Int) -> Any? {
        return array[index]
    }
}
extension KanaViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let paddingWidth = sectionInsets.left * (itemsAtRow + 1.000001)
            let avalableWidth = collectionView.frame.width - paddingWidth
            let widthPerItem = avalableWidth / itemsAtRow
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
}

extension KanaViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var element: Any?
        switch typeOfCollection {
        case .hiragana:
            element = elementByIndex(array: difficult.getArray(typeOf: .hiragana), index: indexPath.row)
        case .katakana:
            element = elementByIndex(array: difficult.getArray(typeOf: .katakana), index: indexPath.row)
        case .kanjiN1:
            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN1), index: indexPath.row)
        case .kanjiN2:
            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN2), index: indexPath.row)
        case .kanjiN3:
            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN3), index: indexPath.row)
        case .kanjiN4:
            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN4), index: indexPath.row)
        case .kanjiN5:
            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN5), index: indexPath.row)
        case .kanjiAll:
            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiAll), index: indexPath.row)
        default: break
        }
        pushToNextViewController(element: element as Any)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        // #warning Incomplete implementation, return the number of items
        return arrayOfElements.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KanaCollectionViewCell", for: indexPath) as? KanaCollectionViewCell else { return UICollectionViewCell() }

        switch typeOfCollection {
        case .hiragana, .katakana:
            let element = arrayOfElements[indexPath.item] as? KanaModel
            cell.setupLabelText(text: element?.kana ?? "-")

        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            let element = arrayOfElements[indexPath.item] as? KanjiModel
            cell.setupLabelText(text: element?.body ?? "-")
        case .none: break
        }
        return cell
    }
}

extension KanaViewController: BottomViewDelegate {
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
