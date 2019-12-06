//
//  UIView+extensions.swift
//  animalML
//
//  Created by Carl Wainwright on 06/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func blackOverlay(loadingIconText: String) {
        
        //set loadingView
        let loadingIcon = LoadingView(text: loadingIconText)
        
        //setup black backgoround
        let overlay: UIView?
        
        //setting frame to be full screen
        overlay = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        //set see through
        overlay?.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        //add subviews to full window
        let currentWindow: UIWindow? = UIApplication.shared.keyWindow
        
        //set tags to allow removoval from superview
        overlay?.tag = 1
        loadingIcon.tag = 2
        currentWindow?.addSubview(overlay!)
        currentWindow?.addSubview(loadingIcon)
    }
    
    func removeBlakcOverLay() {
        
        //remove subviews using tags assigned
        let currentWindow: UIWindow? = UIApplication.shared.keyWindow
        currentWindow?.viewWithTag(1)?.removeFromSuperview()
        currentWindow?.viewWithTag(2)?.removeFromSuperview()
    }
    
    
    //Find viewcontroller of current view ie custom table etc
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
