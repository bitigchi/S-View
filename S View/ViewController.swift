//
//  ViewController.swift
//  S View
//
//  Created by Emir SARI on 22.09.2019.
//  Copyright © 2019 Emir SARI. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var photos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "S View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadImages()
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                photos.append(item)
            }
        }
        
        photos.sort()  
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photo", for: indexPath)
        cell.textLabel?.text = photos[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            vc.selectedImage = photos[indexPath.row]
            vc.imageNumber = indexPath.row + 1
            vc.totalImageNumber = photos.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

