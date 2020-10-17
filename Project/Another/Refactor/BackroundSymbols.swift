//
//  BackGroundsSymbol.swift
//  Project
//
//  Created by ブラック狼 on 08.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

func randomFloat(from: CGFloat, to: CGFloat) -> CGFloat {
    return CGFloat.random(in: from...to)
}

enum TypeOfCollectionItem: String {
    case hiragana = "hiragana"
    case katakana = "katakana"
    case kanjiAll = "AllSegue"
    case kanjiN1 = "n1Segue"
    case kanjiN2 = "n2Segue"
    case kanjiN3 = "n3Segue"
    case kanjiN4 = "n4Segue"
    case kanjiN5 = "n5Segue"
}
