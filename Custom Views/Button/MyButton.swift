//
//  myButton.swift
//  animalML
//
//  Created by Carl Wainwright on 02/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgound: UIView!
    @IBOutlet weak var myButtonLabel: UILabel!
    @IBOutlet var myButtonImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gridyButtonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        gridyButtonInit()
    }
    private func gridyButtonInit() {
        self.layer.cornerRadius = 8
        Bundle.main.loadNibNamed("MyButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = false
        
        backgound.backgroundColor = UIColor.Purples.lightPurple
        myButtonLabel.textColor = UIColor.Purples.darkPurple
        

        
        myButtonLabel.adjustsFontSizeToFitWidth = true
        myButtonLabel.font = UIFont.init(name: "Papyrus", size: self.frame.size.height / 6)
        myButtonLabel.numberOfLines = 0
        myButtonLabel.textAlignment = .center
    }
    
}
