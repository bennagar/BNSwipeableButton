//
//  BNSwipeableButton.swift
//  BNSwipeableButton
//
//  Created by Ben Nagar2 on 4/3/15.
//  Copyright (c) 2015 bngr.net. All rights reserved.
//

import UIKit

protocol BNSwipeableButtonDelegate: class {
    func buttonDidTap()
    func buttonPageDidChange(to page:Int)
}

class BNSwipeableButton: UIView, UIScrollViewDelegate {

    public func setup(colors:[(UIColor,UIColor)], delegate:BNSwipeableButtonDelegate?){
        guard colors.count == 4 else {
            fatalError("must provide 4 colors for the button")
        }
        
        self.colors =  colors
        self.delegate = delegate
        setupSendButton()
    }
    
    weak var delegate: BNSwipeableButtonDelegate?
    
    private var sendButtonScrollView: UIScrollView!
    
    private var colors:[(UIColor,UIColor)]!
    
    private var pages = [UIView]()
    
    private var currentPage = 0
    
    private func setupSendButton(){
        self.sendButtonScrollView = UIScrollView(frame: CGRect(origin: .zero, size: self.frame.size))
        self.insertSubview(sendButtonScrollView, at: 0)
        
        self.sendButtonScrollView.delegate = self
        
        self.sendButtonScrollView.isPagingEnabled = true
        self.sendButtonScrollView.showsHorizontalScrollIndicator = false
        self.sendButtonScrollView.bounces = false
        
        let viewFrame = self.frame
        
        pages = colors.map({createBbuttonPageView(viewFrame, fromColor: $0.0, toColor: $0.1)})
        
        let views:[String : UIView] = ["view": self, "page1": pages[0], "page2": pages[1], "page3": pages[2], "page4": pages[3]]
        
        let verticalConstraints =
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[page1(==view)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(verticalConstraints)
        
        let horizontalConstraints =
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)]|", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
        
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BNSwipeableButton._buttonDidTap))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    private func createBbuttonPageView(_ frame:CGRect, fromColor:UIColor, toColor:UIColor) -> UIView{
        let page:UIView = UIView(frame: frame)
        
        let glayer = CAGradientLayer()
        
        glayer.frame = page.bounds
        glayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        glayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        glayer.colors = [fromColor.cgColor,toColor.cgColor]
        glayer.locations = [ 0.0, 1.0]
        page.layer.insertSublayer(glayer, at: 0)
        
        page.translatesAutoresizingMaskIntoConstraints = false
        self.sendButtonScrollView.addSubview(page)
        return page
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let fractionalPage = scrollView.contentOffset.x / self.frame.size.width
        let page = Int(round(fractionalPage))
        
        if (currentPage != page) {
            delegate?.buttonPageDidChange(to: page)
            // Finally, update previous page
            currentPage = page;
        }
    }
    
    @objc private func _buttonDidTap(){
        delegate?.buttonDidTap()
    }
}
