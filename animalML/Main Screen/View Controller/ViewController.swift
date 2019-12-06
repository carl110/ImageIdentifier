//
//  ViewController.swift
//  animalML
//
//  Created by Carl Wainwright on 02/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    fileprivate var mainFlowController: MainFlowController!
    
    var imagePicker: ImagePicker!
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var imagePickerButton: MyButton!

    
    func assignDependancies(mainFlowController: MainFlowController) {
        self.mainFlowController = mainFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        
        
        buttonSetup()
        titleSetup()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "drawings")!)
        
    }
    
    func buttonSetup() {
        imagePickerButton.myButtonLabel.text = "Select a photo from your library or take a snap with your camera"
        imagePickerButton.myButtonImage.image = UIImage(systemName: "photo.on.rectangle")
    }
    
    func titleSetup() {
        mainTitle.text = "Help me see what this is..."
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont.init(name: "Papyrus", size: 40)
        mainTitle.backgroundColor = UIColor.Blues.softBlue
        mainTitle.textColor = UIColor.Purples.darkPurple
        mainTitle.textAlignment = .center
        mainTitle.alpha = 0.75
        mainTitle.layer.cornerRadius = 20
    }
    
    
    @IBAction func imagePiskerButton(_ sender: Any) {

        
        self.imagePicker.present(from: sender as! UIView)
    print ("PhotoLibraryButton")
        
    }
}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        DispatchQueue.main.async {
            self.mainFlowController.showImageEditor(photo: image!)
        }}
}
