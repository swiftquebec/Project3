//
//  DetailViewController.swift
//  Project1
//
//  Created by Gregory Leck on 2019-04-12.
//  Copyright © 2019 Gregory Leck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title of storyboard
        //title = selectedImage (commented out to conform to challenge)
        if let newTitleText = titleText {
            title = newTitleText
        }
        
        // To remove large title format from initial viewcontroller.
        // "navigationItem" configures only the present screen
        // (As opposed to configuration in ViewController which would
        // force other viewcontrollers to inherit large title mode.
        navigationItem.largeTitleDisplayMode = .never
        
        // Adding rightbar button
        // ".action" displays system icon.
        // "#selector" denotes we are calling the shareTapped method
        // located in "self" i.e., the present viewcontroller
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self
            , action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // To hide the navigation bar when the image appears
    // Tapping the photo removes the navigation bar!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // @objc required to make it visible to obj-c code used by UIBarButtonItem
    @objc func shareTapped() {
        
        // Check to see if there's an image. If there is, the remaining code will be run
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
            else {
                print("No image found")
                return
        }
        
        // Remember if sharing photos,Info.plist must be modified.
        // (Add row: "Privacy -- Photo Library addition")
        // (Add string: "We need to save photos you like" etc)
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        // popoverPresentationController required for iPad
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
