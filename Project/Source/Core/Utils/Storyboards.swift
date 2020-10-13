//
//  Storyboards.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/27/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class Storyboards {
    class var detail: UIStoryboard {
        return UIStoryboard(name: StoryboardsName.detail.rawValue, bundle: nil)
    }
    
    class var main: UIStoryboard {
        return UIStoryboard(name: StoryboardsName.main.rawValue, bundle: nil)
    }
    
    class var kanji: UIStoryboard {
        return UIStoryboard(name: StoryboardsName.kanji.rawValue, bundle: nil)
    }
    
    class var alphabet: UIStoryboard {
        return UIStoryboard(name: StoryboardsName.alphabet.rawValue, bundle: nil)
    }
    
    class var detailSearch: UIStoryboard {
        return UIStoryboard(name: StoryboardsName.detailSearch.rawValue, bundle: nil)
    }
}

private enum StoryboardsName: String {
    case detail = "Detail"
    case main = "Main"
    case kanji = "Kanji"
    case alphabet = "Alphabet"
    case detailSearch = "SearchDetail"
}
