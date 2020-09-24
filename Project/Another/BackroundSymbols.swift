//
//  BackGroundsSymbol.swift
//  Project
//
//  Created by ブラック狼 on 08.06.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import Foundation
import UIKit

func randomFloat(from: CGFloat, to: CGFloat) -> CGFloat{
    let random = CGFloat.random(in: from...to)
    return random
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

/*
func guardExample() -> Bool{
    // сомотри, есть в самом guard до слова else указываается условие которе должно выполнится, а в скобках после else указываается то, что должно быть выполнено, условие после guard не рааботает
    //простой пример:
    let x = background.randomElement()! // здесь развернём принудительно просто для примера
    let y = 50
    // итак у нас есть x - в котором хер пойми что находится(рандомное число из твоего массива) и есть y который всегда 50

    guard x > y else { // если Y окажется меньше случайного X, то guard выполнится нормалаьно и пройдёт даальше, где ввернёт true, а если же нет то войдёт в else { и ввернёт false
        return false
    }
    return true
}
*/
