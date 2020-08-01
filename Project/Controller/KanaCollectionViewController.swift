//
//  CollectionViewController.swift
//  Project
//
//  Created by ブラック狼 on 01.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit




class KanaCollectionViewController: UICollectionViewController {

    let itemsAtRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var typeOfCollection: TypeOfCollectionItem?

    var arrayOfElements = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let type = typeOfCollection else { return }
        arrayOfElements = getArray(typeOf: type)
    }
    
    func pushToNextViewController(element: Any) {
        let nameOfStoryboard: String = "Main"
        
        let vc = UIStoryboard(name: nameOfStoryboard, bundle: nil).instantiateViewController(withIdentifier: "DetailKanaViewController") as! DetailKanaViewController
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
            element = elementByIndex(array: hiragana, index: indexPath.row)
        case .katakana:
            element = elementByIndex(array: katakana, index: indexPath.row)
        case .kanjiN1:
            element = elementByIndex(array: newKanjiArray, index: indexPath.row)
        case .kanjiN2:
            element = elementByIndex(array: newKanjiArray, index: indexPath.row)
        case .kanjiN3:
            element = elementByIndex(array: newKanjiArray, index: indexPath.row)
        case .kanjiN4:
            element = elementByIndex(array: newKanjiArray, index: indexPath.row)
        case .kanjiN5:
            element = elementByIndex(array: newKanjiArray, index: indexPath.row)
        case .kanjiAll:
            element = elementByIndex(array: kanji, index: indexPath.row)
        default: break
        }
        pushToNextViewController(element: element as Any)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        return arrayOfElements.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kanaCell", for: indexPath) as? KanaCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch typeOfCollection {
        case .hiragana, .katakana:
            let element = arrayOfElements[indexPath.item] as? Kana
            cell.labelKana.text = element?.kana ?? "-"
        case .kanjiAll, .kanjiN1, .kanjiN2, .kanjiN3, .kanjiN4, .kanjiN5:
            let element = arrayOfElements[indexPath.item] as? Kanji
            cell.labelKana.text = element?.body ?? "-"
        case .none: break
        }
    
        cell.backgroundColor = .blue
    
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
    
   

