//
//  File.swift
//  Project
//
//  Created by ブラック狼 on 09.10.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class FourButtom: UIView {
    
    @IBOutlet weak var firstButtom: UIButton!
    @IBOutlet weak var secondButtom: UIButton!
    @IBOutlet weak var thirdButtom: UIButton!
    @IBOutlet weak var fourthButtom: UIButton!
    
    let nibName = "FourButtom"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    func setup() {
        let view = loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
}
