//
//  ImageEditorViewController.swift
//  animalML
//
//  Created by Carl Wainwright on 02/12/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit
import Firebase

class ImageEditorViewController: UIViewController {
    
    fileprivate var flowController: ImageEditorFlowController!
    fileprivate var viewModel: ImageEditorViewModel!
    
    private let vision = Vision.vision()
    
    @IBOutlet weak var photoToCheck: UIImageView!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var predictionPercentageLabel: UILabel!

    func assignDependancies(flowController: ImageEditorFlowController, viewModel: ImageEditorViewModel) {
        self.viewModel = viewModel
        self.flowController = flowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.blackOverlay(loadingIconText: "Analyzing your Image...")
        //Set image and add coloured frame
        photoToCheck.image = viewModel.photo.imageWithBorder(width: 15, color: UIColor.Shades.standardBlack)
        
        DispatchQueue.main.async {
            //Run prediction function
            self.predict(img: self.viewModel.photo)
        }
        
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "drawings")!)
        
        predictionLabel.numberOfLines = 0
        predictionLabel.backgroundColor = UIColor.Shades.standardBlack

        predictionPercentageLabel.numberOfLines = 0
        predictionPercentageLabel.backgroundColor = UIColor.Shades.standardBlack
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //when view appears remove overlay loading screen
            self.view.removeBlakcOverLay()
        }
    }
    
    
    func predict(img: UIImage) {
        
        //Set containers to append attributed text to
        let combinedPredText = NSMutableAttributedString()
        let combinedPrePercText = NSMutableAttributedString()
        
        //Set centerinh for attributes use
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        //Set Atrtributes to be used in text
        let predTitleTextAttributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                       NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                       NSAttributedString.Key.strokeColor: UIColor.Yellows.lightYellow,
                                       NSAttributedString.Key.strokeWidth: 4,
                                       NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: predictionLabel.frame.size.width / 8)] as [NSAttributedString.Key : Any]
        
        //Add attributes tpo text
        let predText = NSAttributedString(string: "OBJECT", attributes: predTitleTextAttributes)
        let predPercText = NSAttributedString(string: "PERCENTAGE", attributes: predTitleTextAttributes)
        let titleGap = NSAttributedString(string: "\n\n")
        
        //Append text to containers
        combinedPredText.append(predText)
        combinedPredText.append(titleGap)
        combinedPrePercText.append(predPercText)
        combinedPrePercText.append(titleGap)
        
        //Set image prediction
        let labelDetector = vision.onDeviceImageLabeler()
        let visionImage = VisionImage(image: img)
        
        labelDetector.process(visionImage) { (labels, error) in
            guard error == nil, let labels = labels, !labels.isEmpty else {
                self.predictionLabel.text = "Unable to identify anything from this Image"
                return
            }
            
            //For each object identified add a label
            for label in labels {
                
                let predLabelAttributes = [NSAttributedString.Key.foregroundColor: UIColor.getRandomColor,
                                           NSAttributedString.Key.paragraphStyle: paragraphStyle] as [NSAttributedString.Key : Any]
                
                let predictionText: NSMutableAttributedString = NSMutableAttributedString(string: "\(label.text)  -\n", attributes: predLabelAttributes)
                combinedPredText.append(predictionText)
                
                let predictionPercentageText: NSMutableAttributedString = NSMutableAttributedString(string: "-  \((Double(truncating: label.confidence!) * 100.0).rounded(toPlaces: 2))%\n", attributes: predLabelAttributes)
                combinedPrePercText.append(predictionPercentageText)
            }
            
            //Add text to labels
            self.predictionLabel.attributedText = combinedPredText
            self.predictionPercentageLabel.attributedText = combinedPrePercText
        }
    }
}
