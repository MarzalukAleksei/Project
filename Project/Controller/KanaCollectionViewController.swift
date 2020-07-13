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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let element = hiragana[indexPath.item]
        let vc = DetailKanaViewController()
        vc.startElement = element
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "kanaSegue" {
//            let destinationKana = segue.destination as! DetailKanaViewController
//            let cell = sender as! KanaCollectionViewCell
//            destinationKana.detailKana = cell.labelKana.text ?? ""
//
//        }
//    }
    
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        return kanaCount()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kanaCell", for: indexPath) as! KanaCollectionViewCell

        
        
        cell.labelKana.text = hiragana[indexPath.item].kana
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
    
   
