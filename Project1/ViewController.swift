//
//  ViewController.swift
//  Project1
//
//  Created by Gregory Leck on 2019-04-12.
//  Copyright © 2019 Gregory Leck. All rights reserved.
//

import UIKit

// ViewController to inherit from UITableViewController
// and not UIViewController
class ViewController: UITableViewController {
    
    // array of pictures starting with nssl
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title of storyboard
        title = "Storm Viewer"
        // Adopt large title format
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Create filemanager
        let fm = FileManager.default
        // "path" is set to app's Bundle (binary + assets)
        let path = Bundle.main.resourcePath!
        // "items" is set to all the contents found in the directory
        // located at the path designated above.
        // "items" is an array of all resources found
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // Loop through the item array
        for item in items {
            if item.hasPrefix("nssl") {
                // This is a picture to load
                // to be appended to the "pictures" array.
                pictures.append(item)
            }
            // Sort pictures
            pictures.sort()
        }
        print(pictures)
    }
    
    // Require two methods:
    // 1) Tell ViewController how many rows to show
    // 2) What each row should contain
    
    // 1) How many rows for table:
    // (App has only one section, so that parameter can be ignored)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // 2) What each row should look like
    // indexPath contains both a row and section (section can be ignored)
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // cell has textLabel property
        cell.textLabel?.text = "\(pictures[indexPath.row]) - Picture \(indexPath.row + 1) of \(pictures.count)"
        return cell
    }
    
    // What happens when a row is touched
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // vc is cast as DetailViewController otherwise swift will presume
        // a regular ViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // "selectedImage" is a property of DetailViewController
            // that is set by the following:
            vc.selectedImage = pictures[indexPath.row]
            
            // Pass along unique detail title text
            vc.titleText = "Picture \(indexPath.row + 1) of \(pictures.count)"
            
            // Push it onto the navigation controller:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
