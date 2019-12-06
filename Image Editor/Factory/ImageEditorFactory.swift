//
//  ImageEditorFactory.swift
//  animalML
//
//  Created by Carl Wainwright on 02/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class ImageEditorFactory {
    
    static func PushIn(navigationController: UINavigationController, photo: UIImage) {
        
        let storyBoard = UIStoryboard(name: "ImageEditor", bundle: nil).instantiateInitialViewController() as! ImageEditorViewController
        let flowController = ImageEditorFlowController(navigationController: navigationController)
        let viewModel = ImageEditorViewModel(photo: photo)
        
        storyBoard.assignDependancies(flowController: flowController, viewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }
    
}
