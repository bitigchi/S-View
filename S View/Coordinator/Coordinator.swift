//
//  Coordinator.swift
//  S View
//
//  Created by Emir SARI on 23.09.2019.
//  Copyright © 2019 Emir SARI. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
