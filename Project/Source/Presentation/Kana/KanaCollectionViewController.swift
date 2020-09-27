//
//  CollectionViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanaCollectionViewController: UICollectionViewController {

    let itemsAtRow = itemsInCollectionView
    let sectionInsets = UIEdgeInsets(top: edgeInCollectionViewTop, left: edgeInCollectionViewLeft, bottom: edgeInCollectionViewBottom, right: edgeInCollectionViewRight)
    
    var typeOfCollection: TypeOfCollectionItem?

    var arrayOfElements = [Any]()
    
    let difficult = DifficultLevel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let type = typeOfCollection else { return }
        arrayOfElements = difficult.getArray(typeOf: type)
        collectionView.backgroundColor = designBackgroundColor
    }
    
    func pushToNextViewController(element: Any) {
        guard let vc = ViewControllers.detail as? DetailKanaViewController else { return }
        vc.startElement = element
        vc.typeOfColletion = typeOfCollection
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func elementByIndex(array: [Any], index: Int) -> Any? {
        return array[index]
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        return arrayOfElements.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kanaCell", for: indexPath) as? KanaCollectionViewCell else { return UICollectionViewCell() }
        
        switch typeOfCollection {
        case .hiragana, .katakana:
            let element = arrayOfElements[indexPath.item] as? KanaModel
            cell.label.text = element?.kana ?? "-"
            if element?.mistake == true {
                cell.label.textColor = .red
            }
        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            let element = arrayOfElements[indexPath.item] as? KanjiModel
            cell.label.text = element?.body ?? "-"
            if element?.mistake == true {
                cell.label.textColor = .red
            }
        case .none: break
        }
        cell.layer.cornerRadius = cell.bounds.width * designElementCornerRadius
        cell.backgroundColor = designElementColor
        cell.label.textAlignment = .center
        cell.label.textColor = designTextColor
        return cell
    }
}
extension KanaCollectionViewController: UICollectionViewDelegateFlowLayout{
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
    
   
