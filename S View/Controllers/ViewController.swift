//
//  ViewController.swift
//  S View
//
//  Created by Emir SARI on 22.09.2019.
//  Copyright © 2019 Emir SARI. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    let dataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "S View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = dataSource
        loadImages()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.selectedImage = dataSource.photos[indexPath.row]
            vc.imageNumber = indexPath.row + 1
            vc.totalImageNumber = dataSource.photos.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
         
        for item in items {
            if item.hasPrefix("nssl") {
                dataSource.photos.append(item)
            }
        }
        dataSource.photos.sort()
    }
}

