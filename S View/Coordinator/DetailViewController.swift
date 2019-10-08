//
//  DetailViewController.swift
//  S View
//
//  Created by Emir SARI on 22.09.2019.
//  Copyright © 2019 Emir SARI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    var selectedImage: String?
    var imageView: UIImageView!
    var imageNumber = 0
    var totalImageNumber = 0

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("No image found")
            return
        }
        guard let imageName = selectedImage else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
