//
//  KanjiViewController.swift
//
//
//  Created by ブラック狼 on 07.07.2020.
//

import UIKit

class KanjiViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kanjiCell", for: indexPath) as! KanjiCollectionViewCell
        cell.kanjiListLabel.text = "111"
        cell.backgroundColor = .red
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension KanjiViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension KanjiViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
}
