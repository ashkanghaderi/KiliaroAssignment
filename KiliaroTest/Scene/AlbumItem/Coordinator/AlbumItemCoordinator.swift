//
//  AlbumItemCoordinator.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import Foundation
import UIKit

class AlbumItemCoordinator: Coordinator {
    //weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    var albumImageModel: AlbumImageModel?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let albumItemViewController = AlbumItemViewController.instantiate(coordinator: self)
        albumItemViewController.albumImageModel = albumImageModel
        navigationController.pushViewController(albumItemViewController, animated: animated)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
}
