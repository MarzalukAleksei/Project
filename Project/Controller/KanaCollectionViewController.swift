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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        func selectElement(collection: [Kana]) {
        let element = collection[indexPath.item]
        var secondElement: Kana? = nil
        var thirdElement: Kana? = nil
        if element.id != collection.first?.id && element.id != collection.last?.id{
            secondElement = collection[indexPath.item - 1]
            thirdElement = collection[indexPath.item + 1]
        }else if element.id == collection.first?.id{
            thirdElement = collection[indexPath.item + 1]
        }else if element.id == collection.last?.id{
            secondElement = collection[indexPath.item - 1]
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailKanaViewController") as! DetailKanaViewController
        vc.startElement = element
        vc.previousElement = secondElement
        vc.nextElement = thirdElement
        vc.typeOfColletion = typeOfCollection
        self.navigationController?.pushViewController(vc, animated: true)
        
        }
        switch typeOfCollection {
        case .hiragana:
            selectElement(collection: hiragana)
        case .katakana:
            selectElement(collection: katakana)
        default: break
        }
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
        case .kanji:
            cell.labelKana.text = ""
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
    
   

