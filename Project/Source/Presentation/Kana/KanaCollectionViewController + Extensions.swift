//
//  KanaCollectionViewController + Extensions.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/15/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//
import UIKit

extension KanaViewController: UICollectionViewDelegateFlowLayout{
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            let paddingWidth = sectionInsets.left * (itemsAtRow + 1.000001)
//            let avalableWidth = collectionView.frame.width - paddingWidth
//            let widthPerItem = avalableWidth / itemsAtRow
//            return CGSize(width: widthPerItem, height: widthPerItem)
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            return sectionInsets
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//            return sectionInsets.left
//        }
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//            return sectionInsets.left
//        }
}

extension KanaViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var element: Any?
//        switch typeOfCollection {
//        case .hiragana:
//            element = elementByIndex(array: difficult.getArray(typeOf: .hiragana), index: indexPath.row)
//        case .katakana:
//            element = elementByIndex(array: difficult.getArray(typeOf: .katakana), index: indexPath.row)
//        case .kanjiN1:
//            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN1), index: indexPath.row)
//        case .kanjiN2:
//            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN2), index: indexPath.row)
//        case .kanjiN3:
//            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN3), index: indexPath.row)
//        case .kanjiN4:
//            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiN4), index: indexPath.row)
//        case .kanjiN5:
//            element = elementByIndex(array: arrayOfElements, index: indexPath.row)
//        case .kanjiAll:
//            element = elementByIndex(array: difficult.getArray(typeOf: .kanjiAll), index: indexPath.row)
//        default: break
//        }
            element = arrayOfElements[indexPath.row]
        
        pushToNextViewController(element: element as Any)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        // #warning Incomplete implementation, return the number of items
        return arrayOfElements.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KanaCollectionViewCell", for: indexPath) as? KanaCollectionViewCell else { return UICollectionViewCell() }

        switch typeOfCollection {
        case .hiragana:
            let element = arrayOfElements[indexPath.item] as? KanaModel
            cell.setupLabelText(text: element?.hiragana ?? "-")
        case .katakana:
            let element = arrayOfElements[indexPath.item] as? KanaModel
            cell.setupLabelText(text: element?.katakana ?? "-")
        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            let element = arrayOfElements[indexPath.item] as? KanjiModel
            cell.setupLabelText(text: element?.body ?? "-")
        case _: break
        }
        return cell
    }
}

extension KanaViewController: BottomViewDelegate {
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
