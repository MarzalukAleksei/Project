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
}

private enum StoryboardsName: String {
    case detail = "Detail"
}
