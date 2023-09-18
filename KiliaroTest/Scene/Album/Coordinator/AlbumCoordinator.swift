//
//  AlbumCoordinator.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import Foundation
import UIKit

class AlbumCoordinator: Coordinator {
    
    //weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let albumViewController = AlbumViewController.instantiate(coordinator: self)
        navigationController.pushViewController(albumViewController, animated: animated)
    }
    
    func toPreviewImage(item: AlbumImageModel) {
        let AlbumItemtemScene = AlbumItemCoordinator(navigationController: navigationController)
        //AlbumItemtemScene.parentCoordinator = self
        AlbumItemtemScene.albumImageModel = item
        self.childCoordinators.append(AlbumItemtemScene)
        
        AlbumItemtemScene.start()
    }
}
