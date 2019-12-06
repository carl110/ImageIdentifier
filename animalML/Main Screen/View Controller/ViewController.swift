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
    
    private var imagePicker: ImagePicker!
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var imagePickerButton: MyButton!
    
    
    func assignDependancies(mainFlowController: MainFlowController) {
        self.mainFlowController = mainFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "drawings")!)
        buttonSetup()
        titleSetup()
    }
    
    func buttonSetup() {
        
        //Set Atrtributes to be used in text
        let buttonTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Purples.darkPurple,
                                    NSAttributedString.Key.strokeColor: UIColor.Shades.standardBlack,
                                    NSAttributedString.Key.strokeWidth: -0.5] as [NSAttributedString.Key : Any]
        
        //Add attributes tpo text
        let buttonText = NSAttributedString(string: "Select a photo from your library or take a snap with your camera", attributes: buttonTextAttributes)

        imagePickerButton.myButtonLabel.attributedText = buttonText
        imagePickerButton.myButtonImage.image = UIImage(systemName: "photo.on.rectangle")
    }
    
    func titleSetup() {
        mainTitle.text = "Have you ever had trouble deciphering what someone has drawn, or you cannot see something in a photo you are told is there.\nNow you have a second pair of eyes\nLoad your image to see what this AI can see."
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont.init(name: "Papyrus", size: UIFont.labelFontSize)
        mainTitle.backgroundColor = UIColor.Yellows.mustardYellow
        mainTitle.textColor = UIColor.Shades.standardBlack
        mainTitle.textAlignment = .center
        mainTitle.layer.cornerRadius = 20
    }
    
    @IBAction func imagePiskerButton(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
    }
}

extension ViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {

        //Only proceed to next screen if image chosen
        if let newImage = image {
            mainFlowController.showImageEditor(photo: newImage)
        }
    }
}
