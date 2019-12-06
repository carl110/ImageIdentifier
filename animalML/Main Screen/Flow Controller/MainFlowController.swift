//
//  MainFlowController.swift
//  animalML
//
//  Created by Carl Wainwright on 02/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class MainFlowController {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
//Factory of view to show
    func showImageEditor(photo: UIImage) {
        ImageEditorFactory.PushIn(navigationController: navigationController, photo: photo)
    }
    
}

