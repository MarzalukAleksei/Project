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
}

private enum ViewControllersName: String {
    case detail = "DetailViewController"
}
