//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Kyle Meserve on 2/2/20.
//  Copyright © 2020 Norien Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  // Can do this if we don't want to fill the array until the viewDidLoad
  var landmarkNames = [String]()
  var landmarkImages = [UIImage]()
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Sets ViewController up to be a UITableViewDelegate and UITableViewDataSource
    tableView.delegate = self
    tableView.dataSource = self
    
    
    // Image setup. First make array of strings, then array of images (need to append the .png/.jpg if they're not in assets folder
    
    landmarkNames.append("Colusseum")
    landmarkNames.append("Kremlin")
    landmarkNames.append("Stonehenge")
    landmarkNames.append("Taj Mahal")
    
    landmarkImages.append(UIImage(named: "colusseum.jpg")!)
    landmarkImages.append(UIImage(named: "kremlin.jpg")!)
    landmarkImages.append(UIImage(named: "stonehenge.png")!)
    landmarkImages.append(UIImage(named: "tajMahal.jpg")!)
    
  }
  
  // Functions imported from the table view delegate and table view data source
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    // deleting values from arrays
    if editingStyle == .delete {
      landmarkNames.remove(at: indexPath.row)
      landmarkImages.remove(at: indexPath.row)
      // delete the row with an animation
      tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    // indexPath comes for free with tableView
    cell.textLabel?.text = landmarkNames[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return landmarkNames.count
  }

}

