//
//  LibraryViewController.swift
//  Pokedex
//
//  Created by David Yang on 16/01/2019.
//  Copyright © 2019 David Yang. All rights reserved.
//

import UIKit

final class LibraryViewController: UIViewController {
    let model = PokemonModel()
}

extension LibraryViewController {
    @IBAction func selectPicture(_ sender: Any) {
        openMediaPicker()
    }
    
    func openMediaPicker() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            return
        }
        
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        self.present(pickerController, animated: true)
    }
    
    func displayResult(for image: UIImage) {
        guard let rescaledImage = image.scaleImage(newSize: CGSize(width: 299, height: 299)),
            let imagePixelBuffer = rescaledImage.buffer(),
            let prediction = try? model.prediction(image: imagePixelBuffer) else {
                presentAlert(message: "could not load model")
                return
        }
        
        let predictedValue = prediction.classLabel
        let predictedProb = prediction.classLabelProbs[predictedValue]!
        
        let resultText = "\(predictedValue): \(round(predictedProb * 100))%"
        presentAlert(message: resultText)
    }
    
    private func presentAlert(with title: String = "", message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}

extension LibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true) { [weak self] in
            guard let `self` = self else { return }
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.displayResult(for: image)
            }
        }
    }
}
