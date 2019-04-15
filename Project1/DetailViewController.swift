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
}
