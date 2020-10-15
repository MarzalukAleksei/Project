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

