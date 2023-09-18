//
//  AppCoordinator.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation
import UIKit

class AppCoordinator: NSObject, Coordinator {
    
    let window: UIWindow?
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
        super.init()
        navigationController.delegate = self
    }
    
    // Start App
    func start(animated: Bool) {
        guard let window = window else { return }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let flowControllerVC = MainFlowControlViewController.instantiate(coordinator: self)
        navigationController.pushViewController(flowControllerVC, animated: true)
    }
    
    // To Album
    func toAlbum() {
        let AlbumScene = AlbumCoordinator(navigationController: navigationController)
        //AlbumScene.parentCoordinator = self
        self.childCoordinators.append(AlbumScene)
        
        AlbumScene.start()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {}
