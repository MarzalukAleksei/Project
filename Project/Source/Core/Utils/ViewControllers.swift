//
//  ViewControllers.swift
//  Project
//
//  Created by Cyril Romanovsky on 9/27/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class ViewControllers {
    class var detail: UIViewController {
        return Storyboards.detail.instantiateViewController(withIdentifier: ViewControllersName.detail.rawValue) as! DetailViewController
    }
    class var main: UIViewController {
        return Storyboards.main.instantiateViewController(withIdentifier: ViewControllersName.mainBar.rawValue) as! MainBarViewController
    }
}

private enum ViewControllersName: String {
    case detail = "DetailViewController"
    case mainBar = "MainBarViewController"
}
