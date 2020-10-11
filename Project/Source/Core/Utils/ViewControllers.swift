//
//  ViewControllers.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/27/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class ViewControllers {
    class var detail: DetailViewController {
        return Storyboards.detail.instantiateViewController(withIdentifier: ViewControllersName.detail.rawValue) as! DetailViewController
    }
    class var main: MainBarViewController {
        return Storyboards.main.instantiateViewController(withIdentifier: ViewControllersName.mainBar.rawValue) as! MainBarViewController
    }
    
    class var kanji: KanjiViewController {
        return Storyboards.kanji.instantiateViewController(withIdentifier: ViewControllersName.kanji.rawValue) as! KanjiViewController
    }
    
    class var alphabet: AlphabetViewController {
        return Storyboards.alphabet.instantiateViewController(withIdentifier: ViewControllersName.alphabet.rawValue) as! AlphabetViewController
    }
}

private enum ViewControllersName: String {
    case detail = "DetailViewController"
    case mainBar = "MainBarViewController"
    case alphabet = "AlphabetViewController"
    case kanji = "KanjiViewController"
}
