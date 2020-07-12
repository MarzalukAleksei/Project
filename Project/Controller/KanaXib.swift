//
//  UIView.swift
//  Project
//
//  Created by ブラック狼 on 09.07.2020.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

import UIKit

class KanaXib: UIView {

    @IBOutlet var contentView: KanaXib!
    @IBOutlet weak var kanaLabel: UILabel!
    override init (frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("KanaXib", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
//        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
// отключил вьюху
}
