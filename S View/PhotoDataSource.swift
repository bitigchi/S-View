//
//  ProjectDataSource.swift
//  S View
//
//  Created by Emir SARI on 22.09.2019.
//  Copyright © 2019 Emir SARI. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UITableViewDataSource {
    var photos = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photo", for: indexPath)
        cell.textLabel?.text = photos[indexPath.row]
        return cell
    }
}
