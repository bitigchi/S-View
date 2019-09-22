//
//  DetailViewController.swift
//  S View
//
//  Created by Emir SARI on 22.09.2019.
//  Copyright © 2019 Emir SARI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedImage: String?
    var imageView: UIImageView!
    var imageNumber = 0
    var totalImageNumber = 0

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: selectedImage ?? "Image not found")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo \(imageNumber) of \(totalImageNumber)"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
}