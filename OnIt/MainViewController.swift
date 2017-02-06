//
//  MainViewController.swift
//  OnIt
//
//  Created by ExpDev on 9/22/16.
//  Copyright © 2016 2Create360. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var bgUseTicket: UIImageView!
    @IBOutlet var bgBuyTicket: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImage = UIImage(named: "btn_green")
        let sBgImage = bgImage?.resizableImage(withCapInsets: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4), resizingMode: .stretch)
        
        self.bgUseTicket.image = sBgImage
        self.bgBuyTicket.image = sBgImage
        
        //self.btnUseTicket.setBackgroundImage(UIImage(color: UIColor(hex6:0x0)), for: .highlighted)
        
    }
}
