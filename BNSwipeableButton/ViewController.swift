//
//  ViewController.swift
//  BNSwipeableButton
//
//  Created by Ben Nagar2 on 9/21/17.
//  Copyright © 2017 bngr.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate,BNSwipeableButtonDelegate {
    
    @IBOutlet var priorityLabel: UILabel!
    @IBOutlet var button: BNSwipeableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setup(colors: [(.blue,.green), (.green,.yellow), (.yellow,.red), (.red,.purple)], delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonDidTap() {
        priorityLabel.text = "💣"
    }
    
    func buttonPageDidChange(to page:Int){
        // Page has changed, do your thing!
        var text = ""
        switch page{
        case 0:
            text = "❄️"
        case 1:
            text = "🔥"
        case 2:
            text = "🔥🔥"
        case 3:
            text = "🔥🔥🔥"
        default:
            break
        }
        priorityLabel.text = text
    }
}

